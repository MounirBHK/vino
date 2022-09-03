import React from "react";
import "./Main.scss";
import Cellier from "./Cellier";
import SelectCellier from "./SelectCellier";
import FormModifierBouteille from "./FormModifierBouteille";
import { Route, Routes } from "react-router-dom";
import { useLocation } from "react-router-dom";
import SearchIcon from "@mui/icons-material/Search";
import TuneIcon from "@mui/icons-material/Tune";

function Main({ gereQuantite, gereSelectCellier }) {
    const { state: stateBouteille } = useLocation();
    return (
        <div className="Main">
            <div className="Recherche">
                <SearchIcon />
                <input type="text" placeholder="Recherche..." />
                <TuneIcon />
            </div>
            <Routes>
                <Route
                    path="/*"
                    element={
                        <Routes>
                            <Route
                                path="/celliers"
                                element={
                                    <React.Fragment>
                                        <SelectCellier
                                            gereSelectCellier={
                                                gereSelectCellier
                                            }
                                        />
                                        <Cellier gereQuantite={gereQuantite} />
                                    </React.Fragment>
                                }
                            ></Route>
                            <Route
                                path="/modifierBouteille/"
                                element={
                                    <FormModifierBouteille
                                        bouteille={stateBouteille}
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
