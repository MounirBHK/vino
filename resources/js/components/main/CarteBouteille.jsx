import React from "react";
import "./CarteBouteille.scss";
import ButtonGroup from "@mui/material/ButtonGroup";
import Button from "@mui/material/Button";
import { Card } from "@mui/material";
import { useNavigate } from "react-router-dom";

function CarteBouteille({ bouteille, gereQuantite }) {
    const navigate = useNavigate();
    return (
        <Card className="Carte-bouteille">
            <div className="bouteille-img">
                <img src={bouteille.url_img} alt="#" />
            </div>
            <div className="description">
                <p className="nom">Nom: {bouteille.nom_bouteille}</p>
                <p className="quantite">Quantité: {bouteille.quantite}</p>
                <p className="pays">Pays: {bouteille.pays}</p>
                <p className="type">Type: {bouteille.type}</p>
                <p className="millesime">Millésime: {bouteille.millesime}</p>
                <p className="prix">Prix: {bouteille.prix_saq}</p>
            </div>
            <ButtonGroup className="options">
                <Button
                    onClick={() =>
                        navigate("/modifierBouteille/", {
                            state: bouteille,
                        })
                    }
                >
                    Modifier
                </Button>
                <Button
                    value={1}
                    onClick={(e) =>
                        gereQuantite(
                            bouteille.id_cellier,
                            bouteille.id_bouteille,
                            bouteille.quantite,
                            e.target.value
                        )
                    }
                >
                    Ajouter
                </Button>
                <Button
                    value={-1}
                    onClick={(e) =>
                        gereQuantite(
                            bouteille.id_cellier,
                            bouteille.id_bouteille,
                            bouteille.quantite,
                            e.target.value
                        )
                    }
                >
                    Boire
                </Button>
            </ButtonGroup>
        </Card>
    );
}

export default CarteBouteille;
