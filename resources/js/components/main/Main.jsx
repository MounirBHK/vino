import React from "react";
import { useEffect } from "react";
import "./Main.scss";
import Cellier from "./Cellier";
import SelectCellier from "./SelectCellier";
import CarteUneBouteille from "./CarteUneBouteille";
import FormModifierBouteille from "./FormModifierBouteille";
import FormAjoutCellier from "./FormAjoutCellier";
import FormAjoutBouteille from "./FormAjoutBouteille";
import { Route, Routes, useLocation } from "react-router-dom";
import axios from "axios";

function Main({
    gereQuantite,
    gereSelectCellier,
    idCellierEnCours,
    setBouteilles,
    bouteillesCellier,
    setBouteillesCellier,
    setCelliers,
}) {
    const { state: stateBouteille } = useLocation();
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const hostOriginURL = window.location.origin;

    const getAllBouteilles = async () => {
        return await axios.get(hostOriginURL + "/api/bouteilles", {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    useEffect(() => {
        getAllBouteilles().then((response) => {
            setBouteilles(response.data);
        });
    }, []);

    return (
        <div className="Main">
            <Routes>
                <Route
                    path="/*"
                    element={
                        <Routes>
                            <Route
                                path="/celliers"
                                element={
                                    <React.Fragment>
                                        <SelectCellier />
                                    </React.Fragment>
                                }
                            ></Route>
                            <Route
                                path="/celliers/:idCellier"
                                element={
                                    <React.Fragment>
                                        <Cellier
                                            gereQuantite={gereQuantite}
                                            gereSelectCellier={
                                                gereSelectCellier
                                            }
                                            bouteillesCellier={
                                                bouteillesCellier
                                            }
                                        />
                                    </React.Fragment>
                                }
                            ></Route>
                            <Route
                                path="/celliers/:idCellier/:idBouteille"
                                element={
                                    <React.Fragment>
                                        <CarteUneBouteille
                                            gereQuantite={gereQuantite}
                                            bouteille={stateBouteille}
                                        />
                                    </React.Fragment>
                                }
                            ></Route>
                            <Route
                                path="/modifierBouteille"
                                element={
                                    <FormModifierBouteille
                                        bouteille={stateBouteille}
                                    />
                                }
                            ></Route>
                            <Route
                                path="/ajoutCellier"
                                element={
                                    <FormAjoutCellier
                                        setCelliers={setCelliers}
                                    />
                                }
                            ></Route>
                            <Route
                                path="/ajoutBouteille"
                                element={
                                    <FormAjoutBouteille
                                        idCellierEnCours={idCellierEnCours}
                                        bouteillesCellier={bouteillesCellier}
                                        setBouteillesCellier={
                                            setBouteillesCellier
                                        }
                                    />
                                }
                            ></Route>
                        </Routes>
                    }
                ></Route>
            </Routes>
        </div>
    );
}

export default Main;
