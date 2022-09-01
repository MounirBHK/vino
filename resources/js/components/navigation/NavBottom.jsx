import * as React from "react";
import NavBottom from "./NavBottom.scss";
import Fab from "@mui/material/Fab";
import BottomNavigation from "@mui/material/BottomNavigation";
import BottomNavigationAction from "@mui/material/BottomNavigationAction";
import SearchOutlinedIcon from "@mui/icons-material/SearchOutlined";
import AccountCircleOutlinedIcon from "@mui/icons-material/AccountCircleOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import SettingsOutlinedIcon from "@mui/icons-material/SettingsOutlined";
import AddIcon from "@mui/icons-material/Add";

export default function SimpleBottomNavigation() {
    const [value, setValue] = React.useState(0);

    return (
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
    );
}
