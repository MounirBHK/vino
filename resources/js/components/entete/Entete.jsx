import React, { useContext } from "react";
import CelliersContext from "../../context/celliersContext";
import "./Entete.scss";

function Entete({ onSelectCellier }) {
    const celliers = useContext(CelliersContext);
    return (
        <div className="App-header">
            <h1>Hello World</h1>
            <select
                defaultValue={"default"}
                name="celliers"
                id="celliers"
                onChange={(e) => onSelectCellier(e.target.value)}
            >
                <option disabled value={"default"}>
                    Sélectionner un cellier
                </option>
                {celliers.map((cellier) => {
                    return (
                        <option
                            key={cellier.id_cellier}
                            value={cellier.id_cellier}
                        >
                            {cellier.id_cellier} - {cellier.lib_cellier}
                        </option>
                    );
                })}
            </select>
        </div>
    );
}

export default Entete;
