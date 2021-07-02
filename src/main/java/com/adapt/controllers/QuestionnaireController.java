package com.adapt.controllers;

import com.adapt.config.AdaptPropertiesConfig;
import com.adapt.dto.ParticipantStudy;
import com.adapt.questionnaire.Questionnaire;
import com.adapt.services.ParticipantService;
import com.adapt.services.QuestionnaireService;
import com.google.gson.Gson;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import static java.nio.charset.Charset.forName;

@RestController
@RequestMapping("/api/adapt/questionnaire/")
public class QuestionnaireController {
    private final ParticipantService participantService;

    private final QuestionnaireService questionnaireService;
    private final AdaptPropertiesConfig adaptPropertiesConfig;

    public QuestionnaireController(ParticipantService participantService,
                                   QuestionnaireService questionnaireService, AdaptPropertiesConfig adaptPropertiesConfig) {
        this.participantService = participantService;
        this.questionnaireService = questionnaireService;
        this.adaptPropertiesConfig = adaptPropertiesConfig;
    }


    @GetMapping("medicine")
    public List<String> getMedicines() {
        return this.participantService.getDrugsList();

        //return newArrayList("Acarbose","Accupril","Acebutolol","Aceon","Acetazolamide","Actos","Adalat","Aldactazide","Aldactone","Aldomet","Aldoril","Altace","Amaryl","Amiloride + hydrochlorothiazide","Amiloride hydrochloride","Amlodipine","Amlodipine + benazepril","Antara","Apresazide","Apresoline","Aranesp","Aspirin","Atacand","Atenolol","Atenolol + chlorthalidone","atorvastatin","Avandia","Avapro","Benazepril","Benazepril + hydrochlorothiazide","Bepridil","Betapace","Betaxolol","Bisoprolol + hydrochlorothiazide","Bisoprolol/hydrochlorothiazide","Blocadren","Bumetanide","Bumex","Byetta","Caduet","Calan","Calcitriol","Calcium Carbonate","Caltrate","Candesartan","Capoten","Capozide","Captopril","Captopril + hydrochlorothiazide","Cardene","Cardizem","Cardura","Carteolol","Cartrol","Carvedilol","Catapres","Chlorothiazide","Chlorthalidone","cholestyramine","Clonidine","Clopidogrel","Clorpres","colesevelam","Colestid","colestipol","Coreg","Corgard","Corzide","Coumadin","Covera","Cozaar","Crestor","Dalteparin","Danaparoid","darbepoetin alfa","Demadex","Dexferrum","DiaBeta","Diamox","Digoxin","Dilacor","Diltiazem","Diovan","Dipyridamole","Diruil","Doxazosin","Dyazide","DynaCirc","Dyrenium","Edecrin","Enalapril","Enalapril + hydrochlorothiazide","Enoxaparin","epoetin alfa","epoetin beta-methoxy polyethylene glycol","Epogen","Eprosartan","Esidrix","Estrostep Fe","Ethacrynic acid","Exenatide","ezetimibe","ezetimibe + simvastatin","Felodipine","Felodipine + enalapril","fenofibrate","Feraheme","Fergon","Ferralet","Ferrlecit","ferrous gluconate","ferumoxytol","fluvastatin","Fortamet","Fosinopril","Fragmin","Furosemide","gemfibrozil","Glimepiride","Glipizide","Glucophage","Glucotrol","Glyburide","Glynase","Glyset","Guanabenz","Guanfacine","heme iron polypeptide/folic acid","Heparin","Hydralazine","Hydralazine + hydrochlorothiazide","Hydralazine hydrochloride","Hydrochlorothiazide","HydroDiuril","Hytrin","Hyzaar","Imferon","Indapamide","Inderal","Inderal LA","Inderide","INFeD","Innohep","Irbesartan","iron dextran","Isoptin","Isordil","Isosorbide dinitrate","Isradipine","Januvia","Kerlone","Labetalol","Lanoxin","Lanozicaps","Lasix","Lescol","Levatol","Lexxel","Linagliptin","Lipitor","Liraglutide","Lisinopril","Lisinopril + hydrochlorothiazide","Livalo","Loestrin Fe","Lopid","Lopressor","Lopressor HCT","Losartan","Losartan + hydrochlorothiazide","Lotensin","Lotensin HCT","Lotrel","lovastatin","Lovenox","Lozol","Mavik","Maxide","Metformin","Methyldopa","Methyldopa + hydrochlorothiazide","Metolazone","Metoprolol","Metoprolol + hydrochlorothiazide","Mevacor","Micardis","Microzide","Midamor","Miglitol","Minipress","Mircera","Moduretic","Moexipril","Monopril","Mykrox","Nadolol","Nadolol + bendroflumethiazide","Nateglinide","Natrecor","Nesiritide","Niaspan","Nicardipine","nicotinic acid","Nifedipine","Nimodipine","Nimotop","Nisoldipine","Nitrates","Nitroglycerin","Norethindrone Ethinyl Estradiol Ferrous Fumarate/sulfate","Normodyne","Norvasc","Omontys","Onglyza","Orgaran","peginesatide","Penbutolol","Perindopril","Persantine","Pioglitazone","pitavastatin","Plavix","Plendil","Pramlintide","Prandin","Pravachol","pravastatin","Prazosin","Precose","Prinivil","Prinzide","Procardia XL","Procrit","Proferrin","Proferrin-Forte","Propranolol","Propranolol + hydrochlorothiazide","Questran","Quinapril","Ramipril","Renagel","Renvela","Repaglinide","Reserpine","Rocaltrol","Rosiglitazone","rosuvastatin","Saxagliptin","Sectral","Serpasil","Sevelamer","Simron","simvastatin","Sitagliptin","sodium ferric gluconate complex","Sotalol","Spironolactone","Spironolactone + hydrochlorothiazide","Starlix","Sular","Symlin","Tarka","Telmisartan","Tenex","Tenoretic","Tenormin","Terazosin","Teveten","Thalidone","Tiazac","Ticlid","Ticlopidine","Timolol","Tinzaparin","Toprol","Torsemide","Tradjenta","Trandate","Trandolapril","Triamterene","Triamterene + hydrochlorothiazide","Univasc","Valsartan","Vascor","Vaseretic","Vasotec","Verapamil extended release + trandolapril","Verapamil hydrochloride","Verelan","Victoza","Vytorin","Warfarin","Welchol","Wytensin","Zaroxolyn","Zebeta","Zestoretic","Zestril","Zetia","Ziac","Ziac","Zocor");
    }

    @GetMapping("cerealList")
    public List<String> cerealList() {
        return this.participantService.getCerealList();
        //return newArrayList("100% Bran","100% Low Fat Natural Granola","100% Natural Cereal","100% Natural Cereal, with oats, honey and raisins","100% Natural Granola, Oats & Honey","100% Natural Wholegrain Cereal with raisins, lowfat","All-Bran","All-Bran Bran Buds","All-Bran with Extra Fiber","Alpen","Alpha-Bits","Alpha-Bits with marshmallows","Amaranth Flakes","Apple Jacks","Apple Zaps","Apple Zings, Malt-O-Meal","Banana Nut Crunch Cereal","Barley","Basic 4","Berry Colossal Crunch, Malt-O-Meal","Blueberry Morning","Booberry","Bran","Bran Buds","Bran flakes","Bran, Nabisco","Branola","Brown Sugar Bliss","Buckwheat groats","Bulgur","Cap'n Crunch","Cap'n Crunch's Christmas Crunch","Cap'n Crunch's Crunch Berries","Cap'n Crunch's Oops! ChocoDonuts","Cap'n Crunch's Peanut Butter Crunch","Cheerios","Cheerios, Apple Cinnamon","Cheerios, Berry Burst","Cheerios, Berry Burst Strawberry","Cheerios, Berry Burst Triple Berry","Cheerios, Berry Burst, Cherry Vanilla","Cheerios, Berry Burst, Strawberry Banana","Cheerios, Frosted","Cheerios, Honey Nut","Cheerios, Multi Grain","Cheerios, Team","Cheerios, Yogurt Burst, Strawberry","Cheerios, Yogurt Burst, Vanilla","Cheese grits","Chex","Chex Morning Mix Banana Nut","Chex Morning Mix Cinnamon","Chex Morning Mix Fruit & Nut","Chex Morning Mix Honey Nut","Chex, Bran","Chex, Corn","Chex, Honey Nut","Chex, Multi-Bran","Chex, Rice","Chex, Wheat","Chocolate frosted cereal","Cinnamon Cluster Raisin Bran","Cinnamon Crunch Crispix","Cinnamon Grahams Cereal","Cinnamon Marshmallow Scooby Doo!","Cinnamon Toast Crunch","Cinnamon Toast Crunch, Reduced Sugar","Coco-Roos, Malt-O-Meal","Cocoa Blasts","Cocoa Comets","Cocoa Dyno Bites, Malt-O-Meal","Cocoa Krispies","Cocoa Pebbles","Cocoa Puffs","Cocoa Puffs, Reduced Sugar","Cocoa Wheats","Complete Bran Flakes","Complete Oat Bran Flakes","Complete Wheat Bran Flakes","Cookie-Crisp (all flavors)","Corn Bursts, Malt-O-Meal","Corn Flakes, Kellogg's","Corn Pops","Corn Puffs","Corn flakes","Corn flakes, low sodium","Cornmeal mush","Count Chocula","Cracklin' Oat Bran","Cranberry Almond Crunch Cereal","Cream of Rice","Cream of Rye","Cream of Wheat","Crisp Crunch","Crispix","Crispy Brown Rice Cereal","Crispy Rice","Crispy Rice, Malt-O-Meal","Crispy Wheats'N Raisins","Crunchy Corn Bran","Disney Cereal","Disney Hunny B's","Disney Mickey's Magix","Disney Mud & Bugs","Ener-G Pure Rice Bran","Familia","Farina","Fiber 7 Flakes","Fiber One","Frankenberry","French Toast Crunch","Froot Loops","Frosted Flakes, Kellogg's","Frosted Flakes, Malt-O-Meal","Frosted Fruit Rings","Frosted Mini Spooners, Malt-O-Meal","Frosted Mini Wheats","Frosted Shredded Wheat","Frosted Wheat Bites","Frosted cereal, with marshmallows","Frosted corn flakes","Frosted flakes","Frosted rice","Frosty O's","Fruit & Fibre (fiber)","Fruit & Fibre (fiber) with Dates, Raisins and Walnuts","Fruit & Fibre (fiber) with Peaches, Raisins, Almonds, and Oat Clusters","Fruit Harvest","Fruit Harvest Apple Cinnamon","Fruit Harvest Strawberry Blueberry","Fruit Loops","Fruit Rings","Fruit Whirls","Fruit and Cream Oatmeal","Fruity Dyno Bites, Malt-O-Meal","Fruity Pebbles","Golden Crisp","Golden Grahams","Golden Puffs, Malt-O-Meal","Granola","Granola, homemade","Granola, lowfat","Granola, lowfat, Kellogg's","Granola, lowfat, with Raisins, Kellogg's","Grape Nut O's","Grape-Nuts","Grape-Nuts Flakes","Great Grains Crunchy Pecan Whole Grain Cereal","Great Grains, Raisins, Dates, and Pecans Whole Grain Cereal","Grits","Harina de maize con leche","Harmony Vanilla Almond Oats","Healthy Choice","Honey Bunches of Oat Honey Roasted","Honey Bunches of Oat with Strawberry","Honey Bunches of Oats","Honey Bunches of Oats with Almonds","Honey Buzzers, Malt-O-Meal","Honey Crisp Corn Flakes","Honey Crunch Corn Flakes","Honey Graham Squares, Malt-O-Meal","Honey Nut Clusters","Honey Nut Heaven","Honey Nut Shredded Wheat","Honey Smacks","Honeycomb","Honeycomb, strawberry","Instant Grits, all flavors","Jenny O's","Just Right","Just Right with Fruit & Nut","Kaboom","Kasha","Kashi","Kashi GOLEAN","Kashi Good Friends","Kashi Good Friends Cinna-Raisin Crunch","Kashi Heart to Heart Cereal","Kashi Honey Puffed","Kashi Medley","Kashi Organic Promise","Kashi Pilaf","Kashi Pillows","Kashi Seven in the Morning","Kashi, Puffed","Kix","Kix, Berry Berry","Life (plain and cinnamon)","Lucky Charms","Lucky Charms, Berry","Lucky Charms, Chocolate","Magic Stars","Malt-O-Meal","Malt-O-Meal, chocolate","Maltex","Marshmallow Mateys, Malt-O-Meal","Marshmallow Safari","Masa harina","Maypo","Millet","Millet, puffed","Mini-Wheats","Mini-Wheats Frosted Bite Size","Mini-Wheats Frosted Original","Mini-Wheats Frosted Raisin","Mini-Wheats Frosted Strawberry","Mother's Natural Foods Cereal, Quaker","Muesli","Muesli(x)","Multigrain Oatmeal","Multigrain cereal","Natural Bran Flakes","Nature Valley Granola","Nature Valley Granola, with fruit and nuts","Nesquik","Nestum","Nu System Cuisine Toasted Grain Circles","Nutri-Grain","Nutri-Grain Golden Wheat and Raisin","Nutty Nuggets","Oat Bran Cereal, Quaker","Oat Bran Flakes, Health Valley","Oat bran cereal","Oat bran uncooked","Oat cereal","Oat flakes","Oatmeal","Oatmeal Crisp","Oatmeal Crisp with Almonds","Oatmeal Crisp, Apple Cinnamon","Oatmeal Crisp, Raisin","Oatmeal Squares","Oatmeal Swirlers","Oats, raw","Oh's","Oh's, Apple Cinnamon","Oh's, Fruitangy","Oh's, Honey Graham","Old Wessex Irish Style Oatmeal","Optimum Slim, Nature's Path","Optimum, Nature's Path","Oreo O's Cereal","Peanut Butter Toast Crunch","Polenta","Product 19","Puffed Rice, Malt-O-Meal","Puffed Wheat, Malt-O-Meal","Quaker Dinosaur Eggs oatmeal","Quaker Fruit and Cream Oatmeal","Quaker Instant Grits, all flavors","Quaker Multigrain Oatmeal","Quaker Oatmeal Express","Quaker Oatmeal Nutrition for Women","Quaker Oatmeal Squares","Quisp","Raisin Bran Crunch","Raisin Bran, Kellogg's","Raisin Bran, Post","Raisin Nut Bran","Raisin bran (generic)","Reese's Peanut Butter Puffs","Rice Krispies","Rice Krispies, Frosted","Rice Krispies, Treats Cereal","Rice bran, uncooked","Rice cereal","Rice flakes","Rice polishings","Rice, puffed","Roman Meal","Seven-grain Cereal","Shredded Wheat","Shredded Wheat 'N Bran","Shredded Wheat Spoon Size","Shredded Wheat, 100%","Shredded Wheat, Original","Smacks","Smart Start","Smorz","Special K","Special K Fruit & Yogurt","Special K Low Carb Lifestyle Protein Plus","Special K Red Berries","Special K Vanilla Almond","Strawberry Squares","Sun Country 100% Natural Granola, with Almonds","Sweet Crunch","Sweet Puffs","Tasteeos","Toasted Cinnamon Twists, Malt-O-Meal","Toasted Oatmeal Cereal","Toasted Oatmeal, Honey Nut","Toasted oat cereal","Toasties","Toasty O's, Apple Cinnamon, Malt-O-Meal","Toasty O's, Honey and Nut, Malt-O-Meal","Toasty O's, Malt-O-Meal","Tony's Cinnamon Crunchers","Tootie Fruities, Malt-O-Meal","Total","Total Brown Sugar & Oats","Total Corn Flakes","Total Instant Oatmeal","Total Raisin Bran","Trix","Trix, Reduced Sugar","Uncle Sam's Hi Fiber Cereal","Under Cover Bears","Waffle Crisp","Weetabix Whole Wheat Cereal","Wheat Hearts","Wheat bran, unprocessed (miller's bran)","Wheat cereal","Wheat germ","Wheat germ, with sugar and honey","Wheat, puffed","Wheat, puffed, presweetened with sugar","Wheatena","Wheaties","Wheaties Energy Crunch","Wheaties Raisin Bran","Whole wheat cereal","Whole wheat, cracked","Zoom");
    }

    @GetMapping(value = "questionnaireType", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    String getVascularQuestionnaire(@RequestParam Map<String, String> params) {
        String type = params.get("questionnaireType");

        if (adaptPropertiesConfig.isLoadFromDatabase()) {
            Questionnaire questionnaire = questionnaireService.getQuestionnaire(type);

            return new Gson().toJson(questionnaire);

        } else {

            switch (type) {
                case "Vascular Risk":
                    return loadJson("questionnarie/vascular_v.1.json");
                case "Sleep Study":
                    return loadJson("questionnarie/sleep_study_v_1.json");
                case "Everyday Cognition (E-Cog)":
                    return loadJson("questionnarie/e-cog_v_1.json");
                case "Physical Activity Screening":
                    return loadJson("questionnarie/exercise_v_1.json");
                case "Diet Screening":
                    return loadJson("questionnarie/diet_v_1.json");

                default:
                    throw new IllegalStateException("Unexpected value: " + type);
            }
        }
    }

    @PostMapping(value = "saveQuestionnaireFilled", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    boolean saveQuestionnaireFilled(@RequestBody ParticipantStudy participantStudy) {

        participantService.saveQuestionnaireFilled(participantStudy);
        return true;
    }

    @PostMapping(value = "getQuestionnaireFilled", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    ParticipantStudy getQuestionnaireFilled(@RequestBody ParticipantStudy participantStudy) {
        return participantService.getQuestionnaireFilled(participantStudy);
    }

    @GetMapping(value = "save-questionnaire", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    String saveQuestionnaire(@RequestParam Map<String, String> params) {

        String json;

        String type = params.get("questionnaireType");

        switch (type) {
            case "Vascular Risk":
                json = loadJson("questionnarie/vascular_v.1.json");
                break;
            case "Sleep Study":
                json = loadJson("questionnarie/sleep_study_v_1.json");
                break;
            case "Everyday Cognition (E-Cog)":
                json = loadJson("questionnarie/e-cog_v_1.json");
                break;
            case "Physical Activity Screening":
                json = loadJson("questionnarie/exercise_v_1.json");
                break;
            case "Diet Screening":
                json = loadJson("questionnarie/diet_v_1.json");
                break;

            default:
                throw new IllegalStateException("Unexpected value: " + type);
        }

        Questionnaire questionnaire = new Gson().fromJson(json, Questionnaire.class);
        questionnaire.setQuestionType(type);
        try {
            questionnaireService.saveQuestionnaire(questionnaire);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(questionnaire);

        return "success";
    }

    private String loadJson(String path) {
        try {
            final InputStream givenInputStream = new ClassPathResource(path)
                    .getInputStream();
            return IOUtils.toString(givenInputStream, forName("UTF-8"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
