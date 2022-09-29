import { React, useEffect, useState } from "react";
import {
    Button,
    Card,
    Alert,
    IconButton,
    Dialog,
    DialogContent,
    DialogContentText,
    DialogTitle,
    DialogActions,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import AddCircleRoundedIcon from "@mui/icons-material/AddCircleRounded";
import ErrorIcon from "@mui/icons-material/Error";
import DoNotDisturbOnIcon from "@mui/icons-material/DoNotDisturbOn";
import CarteBouteille from "./CarteBouteille";
import { useNavigate, useLocation } from "react-router-dom";
import "./Cellier.scss";

function Cellier({
    gereQuantite,
    gereSelectCellier,
    bouteillesCellier,
    idCellierEnCours,
    setCelliers,
}) {
    const navigate = useNavigate();
    const { state: cellier } = useLocation();
    const [retourActionMsg, setRetourActionMsg] = useState(
        cellier.success_message || null
    );
    const [openSuppDialog, setOpenSuppDialog] = useState(false);
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const hostOriginURL = window.location.origin;

    const deleteCell = async (idCellierEnCours) => {
        // console.log("appel de la fonction ");
        return await axios.delete(
            hostOriginURL + `/api/deleteCellier/${idCellierEnCours}`,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    useEffect(() => {
        gereSelectCellier(cellier.cellier.id);
        if (retourActionMsg)
            navigate(`/dashboard/celliers/${cellier.cellier.id}`, {
                state: { cellier: cellier.cellier },
                replace: true,
            });
        setTimeout(() => {
            setRetourActionMsg(null);
        }, 2500);

        return () => {
            setRetourActionMsg(null);
        };
    }, []);

    const handleSuppCellier = (idCellierEnCours) => {
        // console.log("idCellierEnCours : ",idCellierEnCours);
        deleteCell(idCellierEnCours).then((response) => {
            const newCelliers = response.data;

            const user_id = userLoggedIn.user.id;
            let res = newCelliers.filter(
                (cellier) => cellier.id_user == user_id
            );
            setCelliers([...res]);
            navigate(`/dashboard/celliers`, {
                state: { success_message: "Cellier supprimé!" },
                replace: true,
            });
        });
    };

    const handleCloseDialog = () => {
        setOpenSuppDialog(false);
    };

    return (
        <div className="listeBouteilles">
            <h2>{cellier.cellier.lib_cellier}</h2>
            <Dialog open={openSuppDialog}>
                <DialogContent>
                    <DialogTitle id="attention">ATTENTION</DialogTitle>
                    <DialogContentText id="alert-dialog-description">
                        Voulez vous supprimer ce cellier?
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={handleCloseDialog}
                        autoFocus
                    >
                        Annuler
                    </Button>
                    <Button
                        style={{ color: "#6a3352" }}
                        onClick={() => {
                            handleSuppCellier(idCellierEnCours);
                        }}
                    >
                        Supprimer
                    </Button>
                </DialogActions>
            </Dialog>
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
            {bouteillesCellier.length === 0 && (
                <p className="noBouteille">Aucune bouteille dans ce cellier</p>
            )}
            {bouteillesCellier.map((bouteille) => (
                <Button
                    className="listItemButton"
                    key={bouteille.id}
                    onClick={() =>
                        navigate(
                            `/dashboard/celliers/${cellier.cellier.id}/${bouteille.id_bouteille}`,
                            { state: bouteille }
                        )
                    }
                >
                    <CarteBouteille
                        bouteille={bouteille}
                        gereQuantite={gereQuantite}
                    />
                </Button>
            ))}
            <Button onClick={() => navigate(`/dashboard/ajoutBouteille`)}>
                <Card className="Carte-bouteille">
                    <div className="ajoutBouteille">
                        <div>
                            <h2>Ajouter une Bouteille</h2>
                        </div>
                        <div>
                            <AddCircleRoundedIcon />
                        </div>
                    </div>
                </Card>
            </Button>

            {/* -------------- */}
            {bouteillesCellier.length > 0 && (
                <Button
                    onClick={() =>
                        navigate(
                            `/dashboard/retirerBoutsCell/${cellier.cellier.id}`
                        )
                    }
                >
                    <Card className="Carte-bouteille">
                        <div className="ajoutBouteille">
                            <div>
                                <h2>Retirer Bouteilles</h2>
                            </div>
                            <div>
                                <DoNotDisturbOnIcon />
                            </div>
                        </div>
                    </Card>
                </Button>
            )}

            <Button onClick={() => setOpenSuppDialog(true)}>
                <Card className="Carte-bouteille">
                    <div className="ajoutBouteille">
                        <div>
                            <h2>Supprimer ce Cellier</h2>
                        </div>
                        <div>
                            <ErrorIcon />
                        </div>
                    </div>
                </Card>
            </Button>

            {/* -------------- */}
        </div>
    );
}

export default Cellier;
