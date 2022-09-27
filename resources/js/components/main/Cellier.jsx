import { React, useEffect } from "react";
import { Button, Card } from "@mui/material";
import AddCircleRoundedIcon from "@mui/icons-material/AddCircleRounded";
import ErrorIcon from "@mui/icons-material/Error";
import DoNotDisturbOnIcon from "@mui/icons-material/DoNotDisturbOn";
import CarteBouteille from "./CarteBouteille";
import { useNavigate, useLocation } from "react-router-dom";
import "./Cellier.scss";

function Cellier({ gereQuantite, gereSelectCellier, bouteillesCellier }) {
    const navigate = useNavigate();
    const { state: cellier } = useLocation();

    useEffect(() => {
        gereSelectCellier(cellier.id);
    }, []);
    return (
        <div className="listeBouteilles">
            <h2>{cellier.lib_cellier}</h2>
            {bouteillesCellier.length === 0 && (
                <p className="noBouteille">Aucune bouteille dans ce cellier</p>
            )}
            {bouteillesCellier.map((bouteille) => (
                <Button
                    className="listItemButton"
                    key={bouteille.id}
                    onClick={() =>
                        navigate(
                            `/dashboard/celliers/${cellier.id}/${bouteille.id_bouteille}`,
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
                        navigate(`/dashboard/retirerBoutsCell/${cellier.id}`)
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
                onClick={() => navigate(`/dashboard/suppCellier/${cellier.id}`)}
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
