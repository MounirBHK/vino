import * as React from "react";
import NavBottom from "./NavBottom.scss";
import Fab from "@mui/material/Fab";
import  { useNavigate }  from "react-router-dom";
import Box from '@mui/material/Box';
import Backdrop from '@mui/material/Backdrop';
import SpeedDial from '@mui/material/SpeedDial';
import SpeedDialIcon from '@mui/material/SpeedDialIcon';
import SpeedDialAction from '@mui/material/SpeedDialAction';
import BottomNavigation from "@mui/material/BottomNavigation";
import BottomNavigationAction from "@mui/material/BottomNavigationAction";
import SearchOutlinedIcon from "@mui/icons-material/SearchOutlined";
import AccountCircleOutlinedIcon from "@mui/icons-material/AccountCircleOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import SettingsOutlinedIcon from "@mui/icons-material/SettingsOutlined";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faEarthAmerica, faWineBottle } from "@fortawesome/free-solid-svg-icons";

export default function SimpleBottomNavigation() {
    const [value, setValue] = React.useState(0);
    const navigate = useNavigate();

    const actions = [
        {icon: <FontAwesomeIcon icon={faWineBottle} />,
        name: 'Bouteille'},
        {icon: <FontAwesomeIcon icon={faEarthAmerica} />,
        name: 'Cellier'}
    ];

    return (
        <div className="NavBottom">
            <BottomNavigation
            showLabels
            value={value}
            onChange={(events, newValue) => {
                setValue(newValue);
            }}
        >
            <BottomNavigationAction
                label="Paramêtres"
                icon={<SettingsOutlinedIcon />}
            />
            <BottomNavigationAction
                className="Gauche"
                label="Favoris"
                icon={<FavoriteBorderOutlinedIcon />}
            />
            <BottomNavigationAction
                className="Droite"
                label="Recherche"
                icon={<SearchOutlinedIcon />}
            />
            <BottomNavigationAction
                label="profil"
                icon={<AccountCircleOutlinedIcon />}
            />
        </BottomNavigation>
        <Box sx={{ height: 320, transform: 'translateZ(0px)', flexGrow: 1 }}>
            <SpeedDial
            role="menu"
            ariaLabel="Ajouter"
            icon={<SpeedDialIcon />}
        >
                {actions.map((action) => (
                    <SpeedDialAction
                        key={action.name}
                        icon={action.icon}
                        tooltipTitle={action.name}
                        role="menuitem"
                        onClick={() => navigate(`/dashboard/ajout${action.name}`,
                                {})}
                    />
            ))}
        </SpeedDial>
        </Box>
        </div>

    );
}
