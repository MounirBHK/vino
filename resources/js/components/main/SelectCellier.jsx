import React, { useContext } from "react";
import CelliersContext from "../../context/celliersContext";
import "./SelectCellier.scss";
import { Button, Card } from "@mui/material";
import Box from "@mui/material/Box";
import Divider from "@mui/material/Divider";
import List from "@mui/material/List";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AddCircleRoundedIcon from "@mui/icons-material/AddCircleRounded";
import { faDungeon } from "@fortawesome/free-solid-svg-icons";
import { useNavigate } from "react-router-dom";

function SelectCellier() {
    const navigate = useNavigate();
    const celliersContext = useContext(CelliersContext);
    const [celliers, setCelliers] = celliersContext;
    return (
        <div className="selectCellier">
            <h2>Vos celliers</h2>
            {celliers.length === 0 && (
                <p className="noBouteille">Aucun cellier à afficher</p>
            )}
            <Box className="selectCellier-content">
                <List component="nav">
                    {celliers.map((cellier) => {
                        return (
                            <React.Fragment key={cellier.id}>
                                <ListItemButton
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
                                    <ListItemText
                                        primary={cellier.lib_cellier}
                                    />
                                </ListItemButton>
                                <Divider variant="middle" />
                            </React.Fragment>
                        );
                    })}
                </List>
                <React.Fragment>
                    <Button onClick={() => navigate(`/dashboard/ajoutCellier`)}>
                        <Card className="Carte-cellier">
                            <div className="ajoutCellier">
                                <div>
                                    <h2>Ajouter un cellier</h2>
                                </div>
                                <div>
                                    <AddCircleRoundedIcon />
                                </div>
                            </div>
                        </Card>
                    </Button>
                </React.Fragment>
            </Box>
        </div>
    );
}

export default SelectCellier;

{
    /* <FormControl sx={{ m: 1, minWidth: 120 }}>        <InputLabel id="demo-simple-select-helper-label">Age</InputLabel>        <SelectlabelId="demo-simple-select-helper-label"id="demo-simple-select-helper"value={age}label="Age"onChange={handleChange}> */
}
