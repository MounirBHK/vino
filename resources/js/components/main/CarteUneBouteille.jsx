import React from "react";
import ReactDOM from 'react-dom'
import "./CarteUneBouteille.scss";
import ButtonGroup from "@mui/material/ButtonGroup";
import Button from "@mui/material/Button";
import Grid from '@mui/material/Grid';
import CircleIcon from '@mui/icons-material/Circle';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faEarthAmerica, faCalendar, faFlag, faMap, faSackDollar, faTractor, faDroplet } from '@fortawesome/free-solid-svg-icons';
import { useNavigate } from "react-router-dom";

function CarteUneBouteille({ bouteille, gereQuantite }) {
    const navigate = useNavigate();
    const url = bouteille.url_img;
    const urlNoParam = url.split('?')[0];

    return (
        <div className="Carte-une-bouteille">
                <div className="couleur">
                    <p className={bouteille.type} ><CircleIcon sx={{ fontSize: 150, top: 250, left: 200 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 50, top: 300, left: 100 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 250, top: 150, left: 55 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 200, top: 75, left: 110 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 75, top: 180, left: 30 }} /></p>
                </div>
                <div className="nom">
                    <h2>{bouteille.nom_bouteille}</h2>
                </div>
                <div className="grid">
                    <div className="bouteille-img">
                        <img src={urlNoParam} alt="bouteille" />
                    </div>
                        <div className="pays icon"><FontAwesomeIcon icon={faEarthAmerica} />
                            <p><b>pays</b><br />{bouteille.pays}</p>
                        </div>
                        <div className="producteur icon"><FontAwesomeIcon icon={faTractor} />
                            <p><b>producteur</b> <br />{bouteille.producteur}</p>
                        </div>
                        <div className="region icon"><FontAwesomeIcon icon={faMap} />
                            <p><b>region</b><br />{bouteille.region}</p>
                        </div>
                        <div className="alcool icon"><FontAwesomeIcon icon={faDroplet} />
                            <p><b>alcool</b><br />{bouteille.degre_alcool}%</p>
                        </div>
                        <div className="millesime icon"><FontAwesomeIcon icon={faCalendar} />
                            <p><b>millesime</b><br />{bouteille.millesime}</p>
                        </div>
                        <div className="prix icon"><FontAwesomeIcon icon={faSackDollar} />
                            <p><b>prix</b><br />{bouteille.prix_saq}$</p>
                        </div>
            </div>
            <div className="quantite icon">
                            <h3>Qté</h3>
                            <p>{bouteille.quantite}</p>
                        </div>
            <ButtonGroup variant="text" className="options">
                <Button
                    onClick={() =>
                        navigate("/dashboard/modifierBouteille", {
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
    </div>
    );
}

export default CarteUneBouteille;
