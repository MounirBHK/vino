import axios from "axios";
import React, { useState, useEffect } from "react";
import { Route, Routes, useNavigate, useLocation } from "react-router-dom";
import { CelliersProvider } from "../context/celliersContext";
import { BouteillesProvider } from "../context/bouteillesContext";
import { UserProvider } from "../context/userContext";
import Entete from "./entete/Entete";
import Main from "./main/Main";
import NavBottom from "./navigation/NavBottom";
import Homepage from "./homepage/Homepage";
import AdminHome from "./admin/AdminHome";
import Page404 from "./Page404";

function App() {
    const location = useLocation();
    const [bouteilles, setBouteilles] = useState([]);
    const [bouteillesCellier, setBouteillesCellier] = useState([]);
    const [celliers, setCelliers] = useState([]);
    const [idCellierEnCours, setIdCellierEnCours] = useState("");
    const [user, setUser] = useState(null);
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const adminUser = localStorage.getItem("adminUser") || null;
    const navigate = useNavigate();

    const getCelliers = async (userId) => {
        return await axios.get(hostOriginURL + "/api/celliers/user/" + userId, {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const getBouteillesCellier = async (idCellier) => {
        return await axios.get(hostOriginURL + "/api/cellier/" + idCellier, {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const changeQuantite = async (
        idCellier,
        idBouteille,
        quantite,
        operation
    ) => {
        const bouteille = {
            idCellier: idCellier,
            idBouteille: idBouteille,
            quantite: quantite,
            operation: operation,
        };
        return await axios.put(
            hostOriginURL + "/api/changeQuantiteBouteille",
            bouteille,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const deconnecteUser = async () => {
        return await axios.get(hostOriginURL + "/api/custom-auth/logout", {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    useEffect(() => {
        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            getCelliers(userId).then((celliersData) => {
                setCelliers(celliersData.data);
            });
        }
    }, [user]);

    useEffect(() => {
        //Réinitialise le user dans le cas d'un rafraichissement forcé de la page
        if (userLoggedIn) {
            setUser(userLoggedIn);
            if (!window.location.pathname.includes("dashboard"))
                navigate("/dashboard", {});
        }
        if (adminUser && window.location.pathname.includes("admin"))
            navigate("/admin", {});
        let arrayLocation;
        if (location.pathname.includes("celliers")) {
            arrayLocation = location.pathname.split("/");
            const idCellier = arrayLocation[3];
            gereSelectCellier(idCellier);
        }
    }, []);

    function gereDeconnexion(userLoggedIn) {
        const userInLocalStorage = JSON.parse(localStorage.getItem("user"));
        if (userInLocalStorage.user.id === userLoggedIn.user.id) {
            deconnecteUser().then((response) => {
                if (response.data === 1) {
                    localStorage.removeItem("user");
                    setUser(null);
                }
            });
        }
    }

    function gereSelectCellier(idCellier) {
        getBouteillesCellier(idCellier).then((bouteillesData) => {
            setBouteillesCellier(bouteillesData.data);
            setIdCellierEnCours(idCellier);
        });
    }
    function gereQuantite(
        idCellier,
        idBouteille,
        quantite,
        operation,
        bouteille
    ) {
        let bouteilleChangee;

        changeQuantite(
            idCellier,
            idBouteille,
            quantite,
            operation,
            bouteille
        ).then((response) => {
            const idCellier = response.data[0].id_cellier;
            const idBouteille = response.data[0].id_bouteille;
            const quantite = response.data[0].quantite;
            const newBouteilles = bouteillesCellier.map((bouteille) => {
                if (
                    bouteille.id_bouteille === idBouteille &&
                    bouteille.id_cellier === idCellier
                ) {
                    bouteille.quantite = quantite;
                    bouteilleChangee = bouteille;
                }
                return bouteille;
            });
            setBouteillesCellier(newBouteilles);
            navigate(`/dashboard/celliers/${idCellier}/${idBouteille}`, {
                state: bouteilleChangee,
            });
        });
    }

    return userLoggedIn ? (
        <Routes>
            <Route
                path="/dashboard/*"
                element={
                    <UserProvider value={[user, setUser]}>
                        <CelliersProvider value={[celliers, setCelliers]}>
                            <BouteillesProvider value={bouteilles}>
                                <Entete userLoggedIn={userLoggedIn} />
                                <Main
                                    user={user}
                                    idCellierEnCours={idCellierEnCours}
                                    setBouteilles={setBouteilles}
                                    setCelliers={setCelliers}
                                    bouteillesCellier={bouteillesCellier}
                                    setBouteillesCellier={setBouteillesCellier}
                                    gereQuantite={gereQuantite}
                                    gereSelectCellier={gereSelectCellier}
                                />
                                <NavBottom
                                    gereDeconnexion={gereDeconnexion}
                                    userLoggedIn={userLoggedIn}
                                />
                            </BouteillesProvider>
                        </CelliersProvider>
                    </UserProvider>
                }
            ></Route>
            <Route path="*" element={<Page404 />}></Route>
        </Routes>
    ) : (
        <Routes>
            <Route
                path="/*"
                element={
                    <UserProvider value={{ user: [user, setUser] }}>
                        <Homepage />
                    </UserProvider>
                }
            ></Route>
            <Route
                path="/admin/*"
                element={
                    <AdminHome
                        setBouteilles={setBouteilles}
                        bouteilles={bouteilles}
                    />
                }
            ></Route>
            <Route path="*" element={<Page404 />}></Route>
        </Routes>
    );
}

export default App;
