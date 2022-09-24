import React, { useContext, useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Button, Card } from "@mui/material";
import AddCircleRoundedIcon from "@mui/icons-material/AddCircleRounded";
import CelliersContext from "../../context/celliersContext";
import BouteillesContext from "../../context/bouteillesContext";
import "./Accueil.scss";
import ReactSimplyCarousel from "react-simply-carousel";
import "../../../images/gallerie-vins.jpg";

function Accueil() {
    const navigate = useNavigate();
    const bouteilles = useContext(BouteillesContext);
    const celliersContext = useContext(CelliersContext);
    const [celliers, setCelliers] = celliersContext;
    const bouteillesToDisplay = bouteilles
        .sort(() => 0.5 - Math.random())
        .slice(0, 10);
    const [activeSlideIndex, setActiveSlideIndex] = useState(0);
    return (
        <div className="Accueil-content">
            <h1 className="Accueil-title">Vino</h1>
            {celliers.length === 0 && (
                <React.Fragment>
                    <div className="Accueil-header">
                        <p>Bienvenu dans votre espace!</p>{" "}
                        <p>
                            Créez un cellier pour commencer à le remplir de vos
                            bouteilles préférées!
                        </p>
                    </div>
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
            )}
            <div className="Accueil-catalogue">
                <ReactSimplyCarousel
                    activeSlideIndex={activeSlideIndex}
                    onRequestChange={setActiveSlideIndex}
                    itemsToShow={1}
                    itemsToScroll={1}
                    forwardBtnProps={{
                        style: {
                            alignSelf: "center",
                            background: "black",
                            border: "none",
                            borderRadius: "50%",
                            color: "white",
                            cursor: "pointer",
                            fontSize: "20px",
                            height: 30,
                            lineHeight: 1,
                            textAlign: "center",
                            width: 30,
                        },
                        children: <span>{`>`}</span>,
                    }}
                    backwardBtnProps={{
                        style: {
                            alignSelf: "center",
                            background: "black",
                            border: "none",
                            borderRadius: "50%",
                            color: "white",
                            cursor: "pointer",
                            fontSize: "20px",
                            height: 30,
                            lineHeight: 1,
                            textAlign: "center",
                            width: 30,
                        },
                        children: <span>{`<`}</span>,
                    }}
                    responsiveProps={[
                        {
                            itemsToShow: 2,
                            itemsToScroll: 2,
                            minWidth: 768,
                        },
                    ]}
                    speed={400}
                    easing="linear"
                >
                    <div
                        style={{
                            width: 300,
                            height: 300,
                            backgroundImage:
                                "url(' ../../../images/gallerie-vins.jpg')",
                            color: "#fff",
                            backgroundSize: "cover",
                            backgroundPosition: "center",
                            backgroundRepeat: "no-repeat",
                            backgroundColor: "rgba(0, 0, 0, 0.9)",
                        }}
                    >
                        <div
                            className="Carousel-main"
                            style={{
                                width: 300,
                                height: 300,
                                backgroundColor: "rgba(0, 0, 0, 0.5)",
                            }}
                        >
                            <p>Découvrez notre catalogue de vins</p>
                        </div>
                    </div>
                    {bouteillesToDisplay.map((bouteille) => (
                        <div
                            style={{
                                width: 300,
                                height: 300,
                                background: "#fff",
                            }}
                            key={bouteille.id}
                        >
                            <Card className="Carte-bouteille">
                                <div className="wrapper">
                                    <div className="info">
                                        <h3 className="nom">
                                            {bouteille.nom_bouteille}
                                        </h3>
                                        <p className="pays">
                                            {bouteille.description}
                                        </p>
                                    </div>
                                    <img
                                        className="carte-img"
                                        srcSet={bouteille.url_img}
                                        alt="bouteille"
                                    />
                                </div>
                            </Card>
                        </div>
                    ))}
                </ReactSimplyCarousel>
            </div>
        </div>
    );
}

export default Accueil;
