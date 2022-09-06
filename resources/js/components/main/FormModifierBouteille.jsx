import React from "react";
import "./FormModifierBouteille.scss";

function FormModifierBouteille({ bouteille }) {
    return (
        <React.Fragment>
            <h1>
                Modification d'une bouteille - Cellier: {bouteille.id_cellier} -
                Bouteille: {bouteille.id_bouteille}
            </h1>
            <form>
                <label htmlFor="description">Description:</label>
                <input
                    type="text"
                    name="description"
                    id="description"
                    defaultValue={bouteille.description}
                />
                <button>Valider</button>
                <button>Annuler</button>
            </form>
        </React.Fragment>
    );
}

export default FormModifierBouteille;
