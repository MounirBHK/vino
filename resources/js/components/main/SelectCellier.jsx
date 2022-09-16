import { React, useContext } from "react";
import CelliersContext from "../../context/celliersContext";
import "./SelectCellier.scss";
import Box from '@mui/material/Box';
import List from '@mui/material/List';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import DiamondOutlinedIcon from '@mui/icons-material/DiamondOutlined';
import { Link } from "react-router-dom";

function SelectCellier() {
    const celliers = useContext(CelliersContext);
    return (
            <Box>
                <List component="nav">
                    {celliers.map((cellier) => {
                        return (
                            <Link key={cellier.id} to={`/dashboard/celliers/${cellier.id}`}>
                                <ListItemButton
                            >
                                <ListItemIcon>
                                    <DiamondOutlinedIcon />
                                </ListItemIcon>
                                <ListItemText primary={cellier.lib_cellier} />
                            </ListItemButton>
                            </Link>
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
