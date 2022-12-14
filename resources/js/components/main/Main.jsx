import React, { useState } from "react";
import { useEffect } from "react";
import "./Main.scss";
import Cellier from "./Cellier";
import SelectCellier from "./SelectCellier";
import CarteUneBouteille from "./CarteUneBouteille";
import FormModifierBouteille from "./FormModifierBouteille";
import FormAjoutCellier from "./FormAjoutCellier";
import FormAjoutBouteille from "./FormAjoutBouteille";
import { Route, Routes, useLocation, useNavigate } from "react-router-dom";
import axios from "axios";
// -------------------
import RetirerBouteillesCellier from "./RetirerBouteillesCellier";
import SupprimerCellier from "./SupprimerCellier";
import Profil from "./Profil";
import PasswordResetForm from "./PasswordResetForm";
import Accueil from "./Accueil";
// -------------------

function Main({
    gereQuantite,
    gereSelectCellier,
    idCellierEnCours,
    setBouteilles,
    bouteillesCellier,
    setBouteillesCellier,
    setCelliers,
    user,
}) {
    const navigate = useNavigate();
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
                <Route path="" element={<Accueil />}></Route>
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
                                path="/profil"
                                element={<Profil userLoggedIn={userLoggedIn} />}
                            ></Route>
                            <Route
                                path="/passwordReset/*"
                                element={
                                    <React.Fragment>
                                        <PasswordResetForm
                                            userLoggedIn={userLoggedIn}
                                        />
                                    </React.Fragment>
                                }
                            ></Route>
                            <Route
                                path="/celliers/:idCellier"
                                element={
                                    <React.Fragment>
                                        <Cellier
                                            idCellierEnCours={idCellierEnCours}
                                            gereQuantite={gereQuantite}
                                            gereSelectCellier={
                                                gereSelectCellier
                                            }
                                            bouteillesCellier={
                                                bouteillesCellier
                                            }
                                            setCelliers={setCelliers}
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
                                            gereSelectCellier={
                                                gereSelectCellier
                                            }
                                            setCelliers={setCelliers}
                                        />
                                    </React.Fragment>
                                }
                            ></Route>
                            <Route
                                path="/modifierBouteille"
                                element={
                                    <FormModifierBouteille
                                        bouteille={stateBouteille}
                                        gereSelectCellier={gereSelectCellier}
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

                            {/* ----------------- */}

                            <Route
                                path="/retirerBoutsCell/:idCellier"
                                element={
                                    <RetirerBouteillesCellier
                                        idCellierEnCours={idCellierEnCours}
                                        bouteillesCellier={bouteillesCellier}
                                        setBouteillesCellier={
                                            setBouteillesCellier
                                        }
                                        gereSelectCellier={gereSelectCellier}
                                    />
                                }
                            ></Route>

                            <Route
                                path="/suppCellier/:idCellier"
                                element={
                                    <SupprimerCellier
                                        idCellierEnCours={idCellierEnCours}
                                        bouteillesCellier={bouteillesCellier}
                                        setBouteillesCellier={
                                            setBouteillesCellier
                                        }
                                        setCelliers={setCelliers}
                                    />
                                }
                            ></Route>

                            {/* ----------------- */}
                        </Routes>
                    }
                ></Route>
            </Routes>
        </div>
    );
}

export default Main;
