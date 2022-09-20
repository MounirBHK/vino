import { React, useEffect } from "react";
import { Button, Card } from "@mui/material";
import AddCircleRoundedIcon from "@mui/icons-material/AddCircleRounded";
import CarteBouteille from "./CarteBouteille";
import { useParams, useNavigate, useLocation } from "react-router-dom";
import "./Cellier.scss";

function Cellier({ gereQuantite, gereSelectCellier, bouteillesCellier }) {
    const navigate = useNavigate();
    const { state: cellier } = useLocation();
    // console.log(cellier);
    useEffect(() => {
        gereSelectCellier(cellier.id);
    }, []);

    return (
        <div className="listeBouteilles">
            <h2>{cellier.lib_cellier}</h2>
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
        </div>
    );
}

export default Cellier;
