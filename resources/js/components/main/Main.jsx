import React from "react";
import "./Main.scss";
import Cellier from "./Cellier";
import SelectCellier from "./SelectCellier";
import FormModifierBouteille from "./FormModifierBouteille";
import { Route, Routes } from "react-router-dom";
import { useSearchParams } from "react-router-dom";
import SearchIcon from "@mui/icons-material/Search";
import TuneIcon from "@mui/icons-material/Tune";

function Main({ gereQuantite, gereSelectCellier }) {
    const [params, setParams] = useSearchParams();
    const idCellier = params.get("idCellier");
    const idBouteille = params.get("idBouteille");
    console.log(idCellier, idBouteille);
    return (
        <div className="Main">
            <div className="Recherche">
                <SearchIcon />
                <input type="text" placeholder="Recherche..." />
                <TuneIcon />
            </div>
            <Routes>
                <Route
                    path="/"
                    element={
                        <React.Fragment>
                            <SelectCellier
                                gereSelectCellier={gereSelectCellier}
                            />
                            <Cellier gereQuantite={gereQuantite} />
                        </React.Fragment>
                    }
                ></Route>
                <Route
                    path="/modifierBouteille/"
                    element={
                        <FormModifierBouteille
                            idCellier={idCellier}
                            idBouteille={idBouteille}
                        />
                    }
                ></Route>
            </Routes>
        </div>
    );
}

export default Main;
