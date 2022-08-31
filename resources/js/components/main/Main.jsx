import React from "react";
import "./Main.scss";
import Cellier from "./Cellier";
import SelectCellier from "./SelectCellier";
import FormModifierBouteille from "./FormModifierBouteille";
import { Route, Routes } from "react-router-dom";
import { useSearchParams } from "react-router-dom";

function Main({ gereQuantite, gereSelectCellier }) {
    const params = useSearchParams();
    console.log(params);
    return (
        <div>
            <h1>Main</h1>
            <Routes>
                <Route
                    path="/"
                    element={
                        <div>
                            <SelectCellier
                                gereSelectCellier={gereSelectCellier}
                            />
                            <Cellier gereQuantite={gereQuantite} />
                        </div>
                    }
                ></Route>
                <Route
                    path="/modifierBouteille/"
                    element={<FormModifierBouteille params={params} />}
                ></Route>
            </Routes>
        </div>
    );
}

export default Main;
