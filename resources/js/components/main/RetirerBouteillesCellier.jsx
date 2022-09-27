import React, { useState, useEffect } from "react";
import { useParams, useNavigate, useLocation } from "react-router-dom";
import axios from "axios";
import CarteBouteille from "./CarteBouteille";
import {
    Grid,
    TextField,
    Select,
    MenuItem,
    FormControl,
    Dialog,
    DialogContent,
    DialogContentText,
    DialogTitle,
    DialogActions,
    ListItem,
    Button,
    Box,
    List,
    Divider,
    Alert,
    IconButton,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import Bouteille from "./Bouteille";

export default function RetirerBouteillesCellier({
    idCellierEnCours,
    bouteillesCellier,
}) {
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const hostOriginURL = window.location.origin;
    const [boutsCellRef, setBoutsCellRef] = useState([...bouteillesCellier]);
    const [idRef, setIdRef] = useState(idCellierEnCours);
    const [openConfirmDialog, setOpenConfirmDialog] = useState(false);
    const [bouteilleSupp, setBouteilleSupp] = useState(null);
    const [retourActionMsg, setRetourActionMsg] = useState(null);
    useEffect(() => {
        if (!idCellierEnCours) {
            const urlCourante = document.location.href;
            const idCellURL = parseInt(
                urlCourante.slice(urlCourante.lastIndexOf("/") + 1)
            );
            setIdRef(idCellURL);
            getBouteillesCellier(idCellURL).then((response) => {
                setBoutsCellRef([...response.data]);
            });
        }
    }, []);

    useEffect(() => {
        setTimeout(() => {
            setRetourActionMsg(null);
        }, 2500);
    }, [boutsCellRef]);

    const getBouteillesCellier = async (idCellierEnCours) => {
        return await axios.get(
            hostOriginURL + "/api/cellier/" + idCellierEnCours,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const deleteBoutCell = async (idRef, idBtSupp) => {
        return await axios.delete(
            hostOriginURL + `/api/deleteBoutCellier/${idRef}/${idBtSupp}`,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const handleSuppBoutCell = (bouteille) => {
        deleteBoutCell(idRef, bouteille.id_bouteille).then((response) => {
            let res = boutsCellRef.filter(
                (bout) => bout.id_bouteille !== bouteille.id_bouteille
            );
            setBoutsCellRef(res);
        });
        setOpenConfirmDialog(false);
        setRetourActionMsg("Bouteille supprimée");
    };

    const handleCloseConfirmDialog = (event, reason) => {
        if (reason && reason == "backdropClick") return;
        setOpenConfirmDialog(false);
    };

    const handleOpenConfirmDialog = (bouteille) => {
        setBouteilleSupp(bouteille);
        setOpenConfirmDialog(true);
    };

    return (
        <div>
            <h2>Retirer Bouteilles du Cellier</h2>

            <label htmlFor="liste">
                <Box className="bouteilles">
                    <Dialog
                        className="AjoutBouteilleConfirm-dialog"
                        open={openConfirmDialog}
                        onClose={handleCloseConfirmDialog}
                    >
                        <DialogContent>
                            <DialogContentText>
                                Supprimer cette bouteille du cellier?
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
                                    handleSuppBoutCell(bouteilleSupp);
                                }}
                            >
                                Confirmer
                            </Button>
                        </DialogActions>
                    </Dialog>
                    <Box>
                        <Divider>Liste des Bouteilles</Divider>
                        {retourActionMsg && (
                            <Alert
                                severity="success"
                                action={
                                    <IconButton
                                        aria-label="close"
                                        color="inherit"
                                        size="small"
                                        onClick={() => {
                                            setRetourActionMsg(null);
                                        }}
                                    >
                                        <CloseIcon fontSize="inherit" />
                                    </IconButton>
                                }
                            >
                                {retourActionMsg}
                            </Alert>
                        )}
                        <List className="recherche">
                            {boutsCellRef.map((bouteille) => (
                                <ListItem
                                    divider
                                    key={bouteille.id_bouteille}
                                    onClick={(e) =>
                                        handleOpenConfirmDialog(bouteille)
                                    }
                                >
                                    <Bouteille
                                        idCellierEnCours={idRef}
                                        {...bouteille}
                                    />
                                </ListItem>
                            ))}
                        </List>
                    </Box>
                </Box>
            </label>
        </div>
    );
}
