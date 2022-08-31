import React from "react";
import CelliersContext from "../../context/celliersContext";
import { useContext } from "react";
import "./SelectCellier.scss";

function SelectCellier({ gereSelectCellier }) {
    const celliers = useContext(CelliersContext);
    return (
        <select
            defaultValue={"default"}
            name="celliers"
            id="celliers"
            onChange={(e) => gereSelectCellier(e.target.value)}
        >
            <option disabled value={"default"}>
                Sélectionner un cellier
            </option>
            {celliers.map((cellier) => {
                return (
                    <option key={cellier.id_cellier} value={cellier.id_cellier}>
                        {cellier.id_cellier} - {cellier.lib_cellier}
                    </option>
                );
            })}
        </select>
    );
}

export default SelectCellier;
