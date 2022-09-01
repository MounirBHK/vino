import React from "react";
import CelliersContext from "../../context/celliersContext";
import { useContext } from "react";
import "./SelectCellier.scss";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";
import { FormControl } from "@mui/material";

function SelectCellier({ gereSelectCellier }) {
    const celliers = useContext(CelliersContext);
    return (
        <FormControl className="selectCellier" sx={{ m: 1, minWidth: 250 }}>
            <Select
                className="selectBar"
                defaultValue={"default"}
                name="celliers"
                id="celliers"
                onChange={(e) => gereSelectCellier(e.target.value)}
            >
                <MenuItem className="selectItem" disabled value={"default"}>
                    Sélectionner un cellier
                </MenuItem>
                {celliers.map((cellier) => {
                    return (
                        <MenuItem
                            className="selectItem"
                            key={cellier.id_cellier}
                            value={cellier.id_cellier}
                        >
                            {cellier.id_cellier} - {cellier.lib_cellier}
                        </MenuItem>
                    );
                })}
            </Select>
        </FormControl>
    );
}

export default SelectCellier;

{
    /* <FormControl sx={{ m: 1, minWidth: 120 }}>        <InputLabel id="demo-simple-select-helper-label">Age</InputLabel>        <SelectlabelId="demo-simple-select-helper-label"id="demo-simple-select-helper"value={age}label="Age"onChange={handleChange}> */
}
