import { React, useContext } from "react";
import CelliersContext from "../../context/celliersContext";
import "./SelectCellier.scss";
import { Button } from "@mui/material";
import Box from "@mui/material/Box";
import Divider from "@mui/material/Divider";
import List from "@mui/material/List";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faDungeon } from "@fortawesome/free-solid-svg-icons";
import { useNavigate } from "react-router-dom";

function SelectCellier() {
    const navigate = useNavigate();
    const celliers = useContext(CelliersContext);
    return (
        <Box className="selectCellier">
            <h2>Vos celliers</h2>
            <Divider variant="middle" />
            <List component="nav">
                {celliers.map((cellier) => {
                    return (
                        <React.fragment>
                            <ListItemButton
                                key={cellier.id}
                                onClick={() =>
                                    navigate(
                                        `/dashboard/celliers/${cellier.id}`,
                                        {
                                            state: cellier,
                                        }
                                    )
                                }
                            >
                                <ListItemIcon>
                                    <FontAwesomeIcon
                                        className="navIcon"
                                        icon={faDungeon}
                                    />
                                </ListItemIcon>
                                <ListItemText primary={cellier.lib_cellier} />
                            </ListItemButton>
                        </React.fragment>
                    );
                })}
            </List>
        </Box>
    );
}

export default SelectCellier;

{
    /* <FormControl sx={{ m: 1, minWidth: 120 }}>        <InputLabel id="demo-simple-select-helper-label">Age</InputLabel>        <SelectlabelId="demo-simple-select-helper-label"id="demo-simple-select-helper"value={age}label="Age"onChange={handleChange}> */
}
