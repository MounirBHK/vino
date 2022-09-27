import { React, useEffect, useState } from "react";
import { Button, Card, Alert, IconButton } from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import AddCircleRoundedIcon from "@mui/icons-material/AddCircleRounded";
import ErrorIcon from "@mui/icons-material/Error";
import DoNotDisturbOnIcon from "@mui/icons-material/DoNotDisturbOn";
import CarteBouteille from "./CarteBouteille";
import { useNavigate, useLocation } from "react-router-dom";
import "./Cellier.scss";

function Cellier({ gereQuantite, gereSelectCellier, bouteillesCellier }) {
    const navigate = useNavigate();
    const { state: cellier } = useLocation();
    const [retourActionMsg, setRetourActionMsg] = useState(
        cellier.success_message || null
    );
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
    return (
        <div className="listeBouteilles">
            <h2>{cellier.cellier.lib_cellier}</h2>
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

            <Button
                onClick={() =>
                    navigate(`/dashboard/suppCellier/${cellier.cellier.id}`)
                }
            >
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
