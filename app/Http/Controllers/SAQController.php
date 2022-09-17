<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\Type;
use \App\Models\Bouteille;
use DOMDocument;
use stdClass;

class SAQController extends Controller
{
    const DUPLICATION = 'duplication';
	const ERREURDB = 'erreurdb';
	const INSERE = 'Nouvelle bouteille insérée';

	private static $_webpage;
	private static $_status;
	private $stmt;

	// public function __construct() {
	// 	parent::__construct();
	// 	if (!($this -> stmt = $this -> _db -> prepare("INSERT INTO vino__bouteille(nom, type, image, code_saq, pays, description, prix_saq, url_saq, url_img, format) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"))) {
	// 		echo "Echec de la préparation : (" . $mysqli -> error . ") " . $mysqli -> error;
	// 	}
	// }

    function index() {
		$rejetees = 0;
		$inserees = 0;
		$resultat = self::getProduits(24, 1,"rouge");
		$rejetees += $resultat['rejetees'];
		$inserees += $resultat['inserees'];
		$resultat = self::getProduits(24, 1,"blanc");
		$rejetees += $resultat['rejetees'];
		$inserees += $resultat['inserees'];
		$resultat = self::getProduits(24, 1,"rose");
		$rejetees += $resultat['rejetees'];
		$inserees += $resultat['inserees'];


		$resultat['inserees'] = $inserees;
		$resultat['rejetees'] = $rejetees;
        $bouteilles = Bouteille::all();
        return response()->json(['resultatInsertion' => $resultat, 'bouteilles' => $bouteilles]);;
    }

	/**
	 * getProduits
	 * @param int $nombre
	 * @param int $debut
	 */
	private function getProduits($nombre, $debut, $type) {
		$s = curl_init();
		$url = "https://www.saq.com/fr/produits/vin/vin-".$type."?p=" . $debut . "&product_list_limit=" . $nombre . "&product_list_order=name_asc";
		// curl_setopt($s, CURLOPT_URL, "http://www.saq.com/webapp/wcs/stores/servlet/SearchDisplay?searchType=&orderBy=&categoryIdentifier=06&showOnly=product&langId=-2&beginIndex=".$debut."&tri=&metaData=YWRpX2YxOjA8TVRAU1A%2BYWRpX2Y5OjE%3D&pageSize=". $nombre ."&catalogId=50000&searchTerm=*&sensTri=&pageView=&facet=&categoryId=39919&storeId=20002");
		// curl_setopt($s, CURLOPT_URL, "https://www.saq.com/webapp/wcs/stores/servlet/SearchDisplay?categoryIdentifier=06&showOnly=product&langId=-2&beginIndex=" . $debut . "&pageSize=" . $nombre . "&catalogId=50000&searchTerm=*&categoryId=39919&storeId=20002");
		// curl_setopt($s, CURLOPT_URL, $url);
		// curl_setopt($s, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($s, CURLOPT_CUSTOMREQUEST, 'GET');
        // curl_setopt($s, CURLOPT_NOBODY, false);
		// curl_setopt($s, CURLOPT_FOLLOWLOCATION, 1);

        // Se prendre pour un navigateur pour berner le serveur de la saq...
        curl_setopt_array($s,array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_USERAGENT=>'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0',
            CURLOPT_ENCODING=>'gzip, deflate',
            CURLOPT_HTTPHEADER=>array(
                    'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                    'Accept-Language: en-US,en;q=0.5',
                    'Accept-Encoding: gzip, deflate',
                    'Connection: keep-alive',
                    'Upgrade-Insecure-Requests: 1',
            ),
    ));

		self::$_webpage = curl_exec($s);
		self::$_status = curl_getinfo($s, CURLINFO_HTTP_CODE);
		curl_close($s);

		$doc = new DOMDocument();
		$doc -> recover = true;
		$doc -> strictErrorChecking = false;
		@$doc -> loadHTML(self::$_webpage);
		$elements = $doc -> getElementsByTagName("li");
		$i = 0;
        $j = 0;
		foreach ($elements as $key => $noeud) {
			//var_dump($noeud -> getAttribute('class')) ;
			//if ("resultats_product" == str$noeud -> getAttribute('class')) {
			if (strpos($noeud -> getAttribute('class'), "product-item") !== false) {

				//echo $this->get_inner_html($noeud);
				$info = self::recupereInfo($noeud);
				$retour = $this -> ajouteProduit($info);
				if ($retour['success'] == true) {
					$i++;
				} else {
					$j++;
				}
			}
		}

		return ['inserees' => $i, 'rejetees' => $j];
	}

	private function get_inner_html($node) {
		$innerHTML = '';
		$children = $node -> childNodes;
		foreach ($children as $child) {
			$innerHTML .= $child -> ownerDocument -> saveXML($child);
		}

		return $innerHTML;
	}
	private function nettoyerEspace($chaine)
	{
		return preg_replace('/\s+/', ' ',$chaine);
	}
	private function recupereInfo($noeud) {

		$info = new stdClass();
		$info -> img = $noeud -> getElementsByTagName("img") -> item(0) -> getAttribute('src'); //TODO : Nettoyer le lien
        parse_url($info -> img, PHP_URL_PATH);
		$a_titre = $noeud -> getElementsByTagName("a") -> item(0);
		$info -> url = $a_titre->getAttribute('href');

        //var_dump($noeud -> getElementsByTagName("a")->item(1)->textContent);
        $nom = $noeud -> getElementsByTagName("a")->item(1)->textContent;
        //var_dump($a_titre);
		$info -> nom = self::nettoyerEspace(trim($nom));
		//var_dump($info -> nom);
		// Type, format et pays
		$aElements = $noeud -> getElementsByTagName("strong");
		foreach ($aElements as $node) {
			if ($node -> getAttribute('class') == 'product product-item-identity-format') {
				$info -> desc = new stdClass();
				$info -> desc -> texte = $node -> textContent;
				$info->desc->texte = self::nettoyerEspace($info->desc->texte);
				$aDesc = explode("|", $info->desc->texte); // Type, Format, Pays
				if (count ($aDesc) == 3) {

					$info -> desc -> type = trim($aDesc[0]);
					$info -> desc -> format = trim($aDesc[1]);
					$info -> desc -> pays = trim($aDesc[2]);
				}

				$info -> desc -> texte = trim($info -> desc -> texte);
			}
		}

		//Code SAQ
		$aElements = $noeud -> getElementsByTagName("div");
		foreach ($aElements as $node) {
			if ($node -> getAttribute('class') == 'saq-code') {
				if(preg_match("/\d+/", $node -> textContent, $aRes))
				{
					$info -> desc -> code_SAQ = trim($aRes[0]);
				}



			}
		}

		$aElements = $noeud -> getElementsByTagName("span");
		foreach ($aElements as $node) {
			if ($node -> getAttribute('class') == 'price') {
				$info -> prix = floatval(str_replace(',','.',trim($node -> textContent)));
			}
		}
		//var_dump($info);
		return $info;
	}

	private function ajouteProduit($bte) {
		$retour = [];
		$retour['success'] = true;
		$retour['raison'] = '';

		//var_dump($bte);
		// Récupère le type
		// $rows = $this -> _db -> query("select id from vino__type where type = '" . $bte -> desc -> type . "'");
		$type = Type::select('id')->where('type', '=', $bte -> desc -> type)->get();
		if (count($type) == 1) {
			$type = $type[0]['id'];

			// $rows = $this -> _db -> query("select id from vino__bouteille where code_saq = '" . $bte -> desc -> code_SAQ . "'");
			$bouteilles = Bouteille::select('id')->where('code_saq', '=', $bte -> desc -> code_SAQ)->get();
			if (count($bouteilles) < 1) {
				$bouteille = new Bouteille;
				$bouteille->fill([
					'nom_bouteille'      	=> $bte -> nom,
					'id_type'      	        => $type,
					'image'     			=> $bte -> img,
					'code_saq'     			=> $bte -> desc -> code_SAQ,
					'pays'     				=> $bte -> desc -> pays,
					'description'     		=> $bte -> desc -> texte,
					'prix_saq'     			=> $bte -> prix,
					'url_saq'     			=> $bte -> url,
					'url_img'     			=> $bte -> img,
					'format'     			=> $bte -> desc -> format,
				]);
				$bouteille->save();
				// $this -> stmt -> bind_param("sissssdsss", $bte -> nom, $type, $bte -> img, $bte -> desc -> code_SAQ, $bte -> desc -> pays, $bte -> desc -> texte, $bte -> prix, $bte -> url, $bte -> img, $bte -> desc -> format);
				// $retour -> succes = $this -> stmt -> execute();
				$retour['raison'] = self::INSERE;
				//var_dump($this->stmt);
			} else {
				$retour['success'] = false;
				$retour['raison'] = self::DUPLICATION;
			}
		} else {
			$retour['success'] = false;
			$retour['raison'] = self::ERREURDB;

		}
		return $retour;

	}
}
