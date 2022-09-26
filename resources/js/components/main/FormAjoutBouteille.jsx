import React from "react";
import axios from "axios";
import { useState, useEffect, useContext } from "react";
import {
    Grid,
    TextField,
    Select,
    MenuItem,
    FormControl,
    ListItem,
    Box,
    List,
    Divider,
    Dialog,
    DialogContent,
    DialogContentText,
    DialogTitle,
    DialogActions,
    Button,
} from "@mui/material";
import Bouteille from "./Bouteille";
import BouteillesContext from "../../context/bouteillesContext";
import { useNavigate, useLocation } from "react-router-dom";
import "./FormAjout.scss";
import { Refresh } from "@mui/icons-material";

function FormAjoutBouteille({ idCellierEnCours }) {
    let vi = idCellierEnCours ? idCellierEnCours : "default";
    const [idCell, setIdCell] = useState(vi);
    const navigate = useNavigate();
    const { state: bouteilleAccueil } = useLocation();
    const bouteilles = useContext(BouteillesContext);
    const [bouteillesCopie, setBouteillesCopie] = useState([]);
    const [bouteilleAjoutee, setBouteilleAjoutee] = useState(null);
    const [celliers, setCelliers] = useState([]);
    const [libelle, setLibelle] = useState("");
    const [quantite, setQuantite] = useState(1);
    const [user, setUser] = useState(null);
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const [cellierSelected, setCellierSelected] = useState(null);
    const [openCellierDialog, setOpenCellierDialog] = useState(false);
    const [openConfirmDialog, setOpenConfirmDialog] = useState(false);
    const today = () => {
        var d = new Date().getDate();
        var day = d > 9 ? d : "0" + d;
        var m = new Date().getMonth() + 1;
        var month = m > 9 ? m : "0" + m;
        var year = new Date().getFullYear();
        return year + "-" + month + "-" + day;
    };
    const putBoutCell = async (refBout) => {
        return await axios.post(
            hostOriginURL + "/api/ajouterBouteilleCellier",
            refBout,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const getCelliers = async (userId) => {
        return await axios.get(hostOriginURL + "/api/celliers/user/" + userId, {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const handleBoutCell = (bouteille) => {
        if (idCell !== "default") {
            const refBout = {
                id_cellier: idCell,
                id_bouteille: bouteille.id,
                quantite: quantite,
                derniere_trans: today(),
            };
            putBoutCell(refBout).then((response) => {
                navigate(`/dashboard/celliers/${idCell}`, {
                    state: cellierSelected[0],
                });
            });
        } else alert("Vous n'avez pas sélectionné de cellier...");
    };

    const handleSubmit = (e) => {
        e.preventDefault();
    };

    const handleCloseDialog = (event, reason) => {
        if (reason && reason == "backdropClick") return;
        setOpenCellierDialog(false);
    };

    const handleCloseConfirmDialog = (event, reason) => {
        if (reason && reason == "backdropClick") return;
        setOpenConfirmDialog(false);
    };

    const handleOpenConfirmDialog = (bouteille) => {
        if (idCell !== "default") {
            setBouteilleAjoutee(bouteille);
            setOpenConfirmDialog(true);
        } else alert("Vous n'avez pas sélectionné de cellier...");
    };

    function choixCellier(idCellier) {
        const userId = userLoggedIn.user.id;
        getCelliers(userId).then((response) => {
            setCellierSelected(
                response.data.filter((cellier) => cellier.id == idCellier)
            );
            setIdCell(idCellier);
        });
    }

    useEffect(() => {
        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            getCelliers(userId).then((celliersData) => {
                setCelliers(celliersData.data);
                if (celliersData.data.length == 0) setOpenCellierDialog(true);
            });
        }
    }, [user]);

    useEffect(() => {
        if (idCell !== "default") {
            choixCellier(idCell);
        }
        if (bouteilleAccueil) setBouteillesCopie(bouteilleAccueil);
    }, []);

    useEffect(() => {
        setBouteillesCopie([]);
        let boutsRef = bouteilles;
        let res;
        // if (!libelle) res = [];
        if (!libelle) res = [...boutsRef];
        else
            res = boutsRef.filter(
                (bout) =>
                    bout.code_saq.includes(libelle) ||
                    bout.nom_bouteille
                        .toUpperCase()
                        .includes(libelle.toUpperCase()) ||
                    bout.description
                        .toUpperCase()
                        .includes(libelle.toUpperCase())
            );

        setBouteillesCopie(res);
    }, [libelle]);
    window.scrollTo(0, 0);
    return (
        <div className="FormAjout">
            <Dialog
                className="AjoutBouteilleNoCellier-dialog"
                open={openCellierDialog}
                onClose={handleCloseDialog}
            >
                <DialogTitle>Aucun cellier</DialogTitle>
                <DialogContent>
                    <DialogContentText>
                        Créez votre premier cellier pour y ajouter des
                        bouteilles{" "}
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={() => {
                            handleCloseDialog();
                            navigate(-1);
                        }}
                    >
                        Retour
                    </Button>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={() => {
                            handleCloseDialog();
                            navigate(`/dashboard/ajoutCellier`);
                        }}
                    >
                        Créer un cellier
                    </Button>
                </DialogActions>
            </Dialog>
            <Dialog
                className="AjoutBouteilleConfirm-dialog"
                open={openConfirmDialog}
                onClose={handleCloseConfirmDialog}
            >
                <DialogContent>
                    <DialogTitle>
                        {bouteilleAjoutee
                            ? bouteilleAjoutee.nom_bouteille
                            : null}
                    </DialogTitle>
                    <DialogContentText>
                        <strong>
                            Confirmer l'ajout de cette bouteille au cellier?
                        </strong>
                    </DialogContentText>
                    <DialogContentText className="quantite">
                        <span>Quantité: {quantite ? quantite : null}</span>
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={() => {
                            handleCloseConfirmDialog();
                        }}
                    >
                        Annuler
                    </Button>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={() => {
                            handleBoutCell(bouteilleAjoutee);
                        }}
                    >
                        Confirmer
                    </Button>
                </DialogActions>
            </Dialog>
            <h2>AJOUT DE BOUTEILLES</h2>

            <FormControl className="FormAjout">
                <Select
                    className="selectBar"
                    defaultValue={vi}
                    label="Selectionnez un cellier"
                    name="moncellier"
                    id="moncellier"
                    variant="outlined"
                    onChange={(e) => choixCellier(e.target.value)}
                >
                    <MenuItem
                        variant="outlined"
                        className="selectItem"
                        disabled
                        value={vi}
                    >
                        Sélectionner un cellier
                    </MenuItem>
                    {celliers.map((cellier) => {
                        return (
                            <MenuItem
                                className="selectItem"
                                key={cellier.id}
                                value={cellier.id}
                            >
                                {cellier.lib_cellier}
                            </MenuItem>
                        );
                    })}
                </Select>
            </FormControl>

            <form className="FormAjout" action="submit" onSubmit={handleSubmit}>
                <Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="text"
                            name="libelle"
                            id="libelle"
                            label="Recherche"
                            variant="outlined"
                            margin="dense"
                            onChange={(e) => setLibelle(e.target.value)}
                            defaultValue={
                                bouteilleAccueil
                                    ? bouteilleAccueil.nom_bouteille
                                    : ""
                            }
                        >
                            Recherche
                        </TextField>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="number"
                            id="quantite"
                            name="quantite"
                            label="Quantité"
                            variant="outlined"
                            margin="dense"
                            onChange={(e) => setQuantite(e.target.value)}
                        >
                            Quantité
                        </TextField>
                    </Grid>
                </Grid>

                <label htmlFor="liste">
                    <Box className="bouteilles">
                        <Box>
                            <Divider>Liste des Bouteilles</Divider>
                            <List className="recherche">
                                {!bouteilleAccueil ? (
                                    bouteillesCopie.length !== 0 ? (
                                        bouteillesCopie.map((bouteille) => (
                                            <ListItem
                                                divider
                                                key={bouteille.id}
                                                onClick={(e) =>
                                                    handleOpenConfirmDialog(
                                                        bouteille
                                                    )
                                                }
                                            >
                                                <Bouteille
                                                    idCell={idCell}
                                                    {...bouteille}
                                                    quantite={quantite}
                                                />
                                            </ListItem>
                                        ))
                                    ) : (
                                        bouteilles.map((bouteille) => (
                                            <ListItem
                                                divider
                                                key={bouteille.id}
                                                onClick={(e) =>
                                                    handleOpenConfirmDialog(
                                                        bouteille
                                                    )
                                                }
                                            >
                                                <Bouteille
                                                    idCell={idCell}
                                                    {...bouteille}
                                                    quantite={quantite}
                                                />
                                            </ListItem>
                                        ))
                                    )
                                ) : (
                                    <ListItem
                                        divider
                                        key={bouteilleAccueil.id}
                                        onClick={(e) =>
                                            handleOpenConfirmDialog(
                                                bouteilleAccueil
                                            )
                                        }
                                    >
                                        <Bouteille
                                            idCell={idCell}
                                            {...bouteilleAccueil}
                                            quantite={quantite}
                                        />
                                    </ListItem>
                                )}
                            </List>
                        </Box>
                    </Box>
                </label>
            </form>
        </div>
    );
}

export default FormAjoutBouteille;
