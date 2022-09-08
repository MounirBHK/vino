import axios from "axios";
import React, { useState, useEffect } from "react";
import { Route, Routes } from "react-router-dom";
import { CelliersProvider } from "../context/celliersContext";
import { BouteillesProvider } from "../context/bouteillesContext";
import { UserProvider } from "../context/userContext";
import Entete from "./entete/Entete";
import Main from "./main/Main";
import NavBottom from "./navigation/NavBottom";
import Homepage from "./homepage/Homepage";
import Page404 from "./Page404";

function App() {
    const [bouteilles, setBouteilles] = useState([]);
    const [celliers, setCelliers] = useState([]);
    const [user, setUser] = useState(null);
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;

    const getCelliers = async (userId) => {
        return await axios.get(hostOriginURL + "/api/celliers/user/" + userId, {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const getBouteilles = async (idCellier) => {
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
        getBouteilles(idCellier).then((bouteillesData) => {
            setBouteilles(bouteillesData.data);
        });
    }

    function gereQuantite(idCellier, idBouteille, quantite, operation) {
        changeQuantite(idCellier, idBouteille, quantite, operation).then(
            (response) => {
                const idCellier = response.data[0].id_cellier;
                const idBouteille = response.data[0].id_bouteille;
                const quantite = response.data[0].quantite;
                const newBouteilles = bouteilles.map((bouteille) => {
                    if (
                        bouteille.id_bouteille === idBouteille &&
                        bouteille.id_cellier === idCellier
                    ) {
                        bouteille.quantite = quantite;
                    }
                    return bouteille;
                });
                setBouteilles(newBouteilles);
            }
        );
    }

    return userLoggedIn ? (
        <Routes>
            <Route
                path="/dashboard/*"
                element={
                    <UserProvider value={user}>
                        <CelliersProvider value={celliers}>
                            <BouteillesProvider value={bouteilles}>
                                <Entete
                                    userLoggedIn={userLoggedIn}
                                    gereDeconnexion={gereDeconnexion}
                                />
                                <Main
                                    gereQuantite={gereQuantite}
                                    gereSelectCellier={gereSelectCellier}
                                />
                                <NavBottom />
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
            <Route path="*" element={<Page404 />}></Route>
        </Routes>
    );
}

export default App;
