import { React, useEffect } from "react";
import { Button, Card } from "@mui/material";
import CarteBouteille from "./CarteBouteille";
import { useParams, useNavigate } from "react-router-dom";
import "./Cellier.scss";


function Cellier({ gereQuantite, gereSelectCellier, bouteillesCellier }) {
    const navigate = useNavigate();
    let route = useParams();
    let { idCellier } = route;

    useEffect(() => {
        gereSelectCellier(idCellier);
    }, []);
    // console.log(bouteillesCellier);
    return (
        <div className="listeBouteilles">
            {bouteillesCellier.map((bouteille) => (
                <Button
                    className="listItemButton"
                    key={bouteille.id}
                    onClick={() =>
                        navigate(
                            `/dashboard/celliers/${idCellier}/${bouteille.id_bouteille}`,
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
            <Button onClick={() =>
                        navigate(
                            `/dashboard/ajoutBouteille`
                        )}>
                    <Card
                        className="Carte-bouteille"
                    >
                        Ajouter bouteille...
                    </Card>
            </Button>
        </div>
    );
}

export default Cellier;
