USE singlishwords;

DROP TABLE IF EXISTS `answer`;
DROP TABLE IF EXISTS `respondent`;
DROP TABLE IF EXISTS `question`;

-- ---------------------------------------
--              CREATE TABLES
-- ---------------------------------------

CREATE TABLE IF NOT EXISTS `respondent` (
--   name                   type            constraints
    `id`                    INT             NOT NULL    AUTO_INCREMENT,
    `age`                   INT             NOT NULL,
    `gender`                VARCHAR(10)     NOT NULL,
    `education`             VARCHAR(256)    NOT NULL,

    `country_of_birth`      VARCHAR(256) ,
    `country_of_residence`  VARCHAR(256) ,
    `ethnicity`             VARCHAR(256) ,
    `is_native`             VARCHAR(4)     ,
    `language_spoken`       TEXT,
    `start_time`            DATETIME        ,
    `end_time`              DATETIME        ,
    `email`                 VARCHAR(320) ,

    PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `question` (
--   name         type            constraints
    `id`          INT             NOT NULL      AUTO_INCREMENT,
    `word`        VARCHAR(128)    NOT NULL,
    
    PRIMARY KEY (`id`)
) CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `answer` (
--   name           type             constraints
    `id`            INT             NOT NULL    AUTO_INCREMENT,

    `association1`  TEXT            NOT NULL,
    `association2`  TEXT            NOT NULL,
    `association3`  TEXT            NOT NULL,
    `time_spend`    INT             NOT NULL,
    `question_id`   INT             NOT NULL,
    `respondent_id`  INT             NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`question_id`)  REFERENCES question(`id`),
    FOREIGN KEY (`respondent_id`) REFERENCES respondent(`id`)
) CHARSET=utf8;

-- Init question data
INSERT INTO `question` (`word`) VALUES
    ("a"), ("abandon"), ("ability"), ("able"), ("abortion"), ("about"), ("above"), ("abroad"), ("absence"), ("absolute"), ("absolutely"), ("absorb"), ("abuse"), ("academic"), ("accept"), ("access"), ("accident"), ("accompany"), ("accomplish"), ("according"), ("account"), ("accurate"), ("accuse"), ("achieve"), ("achievement"), ("acid"), ("acknowledge"), ("acquire"), ("across"), ("act"), ("action"), ("active"), ("activist"), ("activity"), ("actor"), ("actress"), ("actual"), ("actually"), ("ad"), ("adapt"), ("add"), ("addition"), ("additional"), ("address"), ("adequate"), ("adjust"), ("adjustment"), ("administration"), ("administrator"), ("admire"), ("admission"), ("admit"), ("adolescent"), ("adopt"), ("adult"), ("advance"), ("advanced"), ("advantage"), ("adventure"), ("advertising"), ("advice"), ("advise"), ("adviser"), ("advocate"), ("affair"), ("affect"), ("afford"), ("afraid"), ("African"), ("African-American"), ("after"), ("afternoon"), ("again"), ("against"), ("age"), ("agency"), ("agenda"), ("agent"), ("aggressive"), ("ago"), ("agree"), ("agreement"), ("agricultural"), ("ah"), ("ahead"), ("aid"), ("aide"), ("AIDS"), ("aim"), ("air"), ("aircraft"), ("airline"), ("airport"), ("album"), ("alcohol"), ("alive"), ("all"), ("alliance"), ("allow"), ("ally"), ("almost"), ("alone"), ("along"), ("already"), ("also"), ("alter"), ("alternative"), ("although"), ("always"), ("AM"), ("amazing"), ("American"), ("among"), ("amount"), ("analysis"), ("analyst"), ("analyze"), ("ancient"), ("and"), ("anger"), ("angle"), ("angry"), ("animal"), ("anniversary"), ("announce"), ("annual"), ("another"), ("answer"), ("anticipate"), ("anxiety"), ("any"), ("anybody"), ("anymore"), ("anyone"), ("anything"), ("anyway"), ("anywhere"), ("apart"), ("apartment"), ("apparent"), ("apparently"), ("appeal"), ("appear"), ("appearance"), ("apple"), ("application"), ("apply"), ("appoint"), ("appointment"), ("appreciate"), ("approach"), ("appropriate"), ("approval"), ("approve"), ("approximately"), ("Arab"), ("architect"), ("area"), ("argue"), ("argument"), ("arise"), ("arm"), ("armed"), ("army"), ("around"), ("arrange"), ("arrangement"), ("arrest"), ("arrival"), ("arrive"), ("art"), ("article"), ("artist"), ("artistic"), ("as"), ("Asian"), ("aside"), ("ask"), ("asleep"), ("aspect"), ("assault"), ("assert"), ("assess"), ("assessment"), ("asset"), ("assign"), ("assignment"), ("assist"), ("assistance"), ("assistant"), ("associate"), ("association"), ("assume"), ("assumption"), ("assure"), ("at"), ("athlete"), ("athletic"), ("atmosphere"), ("attach"), ("attack"), ("attempt"), ("attend"), ("attention"), ("attitude"), ("attorney"), ("attract"), ("attractive"), ("attribute"), ("audience"), ("author"), ("authority"), ("auto"), ("available"), ("average"), ("avoid"), ("award"), ("aware"), ("awareness"), ("away"), ("awful"), ("baby"), ("back"), ("background"), ("bad"), ("badly"), ("bag"), ("bake"), ("balance"), ("ball"), ("ban"), ("band"), ("bank"), ("bar"), ("barely"), ("barrel"), ("barrier"), ("base"), ("baseball"), ("basic"), ("basically"), ("basis"), ("basket"), ("basketball"), ("bathroom"), ("battery"), ("battle"), ("be"), ("beach"), ("bean"), ("bear"), ("beat"), ("beautiful"), ("beauty"), ("because"), ("become"), ("bed"), ("bedroom"), ("beer"), ("before"), ("begin"), ("beginning"), ("behavior"), ("behind"), ("being"), ("belief"), ("believe"), ("bell"), ("belong"), ("below"), ("belt"), ("bench"), ("bend"), ("beneath"), ("benefit"), ("beside"), ("besides"), ("best"), ("bet"), ("better"), ("between"), ("beyond"), ("Bible"), ("big"), ("bike"), ("bill"), ("billion"), ("bind"), ("biological"), ("bird"), ("birth"), ("birthday"), ("bit"), ("bite"), ("black"), ("blade"), ("blame"), ("blanket"), ("blind"), ("block"), ("blood"), ("blow"), ("blue"), ("board"), ("boat"), ("body"), ("bomb"), ("bombing"), ("bond"), ("bone"), ("book"), ("boom"), ("boot"), ("border"), ("born"), ("borrow"), ("boss"), ("both"), ("bother"), ("bottle"), ("bottom"), ("boundary"), ("bowl"), ("box"), ("boy"), ("boyfriend"), ("brain"), ("branch"), ("brand"), ("bread"), ("break"), ("breakfast"), ("breast"), ("breath"), ("breathe"), ("brick"), ("bridge"), ("brief"), ("briefly"), ("bright"), ("brilliant"), ("bring"), ("British"), ("broad"), ("broken"), ("brother"), ("brown"), ("brush"), ("buck"), ("budget"), ("build"), ("building"), ("bullet"), ("bunch"), ("burden"), ("burn"), ("bury"), ("bus"), ("business"), ("busy"), ("but"), ("butter"), ("button"), ("buy"), ("buyer"), ("by"), ("cabin"), ("cabinet"), ("cable"), ("cake"), ("calculate"), ("call"), ("camera"), ("camp"), ("campaign"), ("campus"), ("can"), ("Canadian"), ("cancer"), ("candidate"), ("cap"), ("capability"), ("capable"), ("capacity"), ("capital"), ("captain"), ("capture"), ("car"), ("carbon"), ("card"), ("care"), ("career"), ("careful"), ("carefully"), ("carrier"), ("carry"), ("case"), ("cash"), ("cast"), ("cat"), ("catch"), ("category"), ("Catholic"), ("cause"), ("ceiling"), ("celebrate"), ("celebration"), ("celebrity"), ("cell"), ("center"), ("central"), ("century"), ("CEO"), ("ceremony"), ("certain"), ("certainly"), ("chain"), ("chair"), ("chairman"), ("challenge"), ("chamber"), ("champion"), ("championship"), ("chance"), ("change"), ("changing"), ("channel"), ("chapter"), ("character"), ("characteristic"), ("characterize"), ("charge"), ("charity"), ("chart"), ("chase"), ("cheap"), ("check"), ("cheek"), ("cheese"), ("chef"), ("chemical"), ("chest"), ("chicken"), ("chief"), ("child"), ("childhood"), ("Chinese"), ("chip"), ("chocolate"), ("choice"), ("cholesterol"), ("choose"), ("Christian"), ("Christmas"), ("church"), ("cigarette"), ("circle"), ("circumstance"), ("cite"), ("citizen"), ("city"), ("civil"), ("civilian"), ("claim"), ("class"), ("classic"), ("classroom"), ("clean"), ("clear"), ("clearly"), ("client"), ("climate"), ("climb"), ("clinic"), ("clinical"), ("clock"), ("close"), ("closely"), ("closer"), ("clothes"), ("clothing"), ("cloud"), ("club"), ("clue"), ("cluster"), ("coach"), ("coal"), ("coalition"), ("coast"), ("coat"), ("code"), ("coffee"), ("cognitive"), ("cold"), ("collapse"), ("colleague"), ("collect"), ("collection"), ("collective"), ("college"), ("colonial"), ("color"), ("column"), ("combination"), ("combine"), ("come"), ("comedy"), ("comfort"), ("comfortable"), ("command"), ("commander"), ("comment"), ("commercial"), ("commission"), ("commit"), ("commitment"), ("committee"), ("common"), ("communicate"), ("communication"), ("community"), ("company"), ("compare"), ("comparison"), ("compete"), ("competition"), ("competitive"), ("competitor"), ("complain"), ("complaint"), ("complete"), ("completely"), ("complex"), ("complicated"), ("component"), ("compose"), ("composition"), ("comprehensive"), ("computer"), ("concentrate"), ("concentration"), ("concept"), ("concern"), ("concerned"), ("concert"), ("conclude"), ("conclusion"), ("concrete"), ("condition"), ("conduct"), ("conference"), ("confidence"), ("confident"), ("confirm"), ("conflict"), ("confront"), ("confusion"), ("Congress"), ("congressional"), ("connect"), ("connection"), ("consciousness"), ("consensus"), ("consequence"), ("conservative"), ("consider"), ("considerable"), ("consideration"), ("consist"), ("consistent"), ("constant"), ("constantly"), ("constitute"), ("constitutional"), ("construct"), ("construction"), ("consultant"), ("consume"), ("consumer"), ("consumption"), ("contact"), ("contain"), ("container"), ("contemporary"), ("content"), ("contest"), ("context"), ("continue"), ("continued"), ("contract"), ("contrast"), ("contribute"), ("contribution"), ("control"), ("controversial"), ("controversy"), ("convention"), ("conventional"), ("conversation"), ("convert"), ("conviction"), ("convince"), ("cook"), ("cookie"), ("cooking"), ("cool"), ("cooperation"), ("cop"), ("cope"), ("copy"), ("core"), ("corn"), ("corner"), ("corporate"), ("corporation"), ("correct"), ("correspondent"), ("cost"), ("cotton"), ("couch"), ("could"), ("council"), ("counselor"), ("count"), ("counter"), ("country"), ("county"), ("couple"), ("courage"), ("course"), ("court"), ("cousin"), ("cover"), ("coverage"), ("cow"), ("crack"), ("craft"), ("crash"), ("crazy"), ("cream"), ("create"), ("creation"), ("creative"), ("creature"), ("credit"), ("crew"), ("crime"), ("criminal"), ("crisis"), ("criteria"), ("critic"), ("critical"), ("criticism"), ("criticize"), ("crop"), ("cross"), ("crowd"), ("crucial"), ("cry"), ("cultural"), ("culture"), ("cup"), ("curious"), ("current"), ("currently"), ("curriculum"), ("custom"), ("customer"), ("cut"), ("cycle"), ("dad"), ("daily"), ("damage"), ("dance"), ("danger"), ("dangerous"), ("dare"), ("dark"), ("darkness"), ("data"), ("date"), ("daughter"), ("day"), ("dead"), ("deal"), ("dealer"), ("dear"), ("death"), ("debate"), ("debt"), ("decade"), ("decide"), ("decision"), ("deck"), ("declare"), ("decline"), ("decrease"), ("deep"), ("deeply"), ("deer"), ("defeat"), ("defend"), ("defendant"), ("defense"), ("defensive"), ("deficit"), ("define"), ("definitely"), ("definition"), ("degree"), ("delay"), ("deliver"), ("delivery"), ("demand"), ("democracy"), ("Democrat"), ("democratic"), ("demonstrate"), ("demonstration"), ("deny"), ("department"), ("depend"), ("dependent"), ("depending"), ("depict"), ("depression"), ("depth"), ("deputy"), ("derive"), ("describe"), ("description"), ("desert"), ("deserve"), ("design"), ("designer"), ("desire"), ("desk"), ("desperate"), ("despite"), ("destroy"), ("destruction"), ("detail"), ("detailed"), ("detect"), ("determine"), ("develop"), ("developing"), ("development"), ("device"), ("devote"), ("dialogue"), ("die"), ("diet"), ("differ"), ("difference"), ("different"), ("differently"), ("difficult"), ("difficulty"), ("dig"), ("digital"), ("dimension"), ("dining"), ("dinner"), ("direct"), ("direction"), ("directly"), ("director"), ("dirt"), ("dirty"), ("disability"), ("disagree"), ("disappear"), ("disaster"), ("discipline"), ("discourse"), ("discover"), ("discovery"), ("discrimination"), ("discuss"), ("discussion"), ("disease"), ("dish"), ("dismiss"), ("disorder"), ("display"), ("dispute"), ("distance"), ("distant"), ("distinct"), ("distinction"), ("distinguish"), ("distribute"), ("distribution"), ("district"), ("diverse"), ("diversity"), ("divide"), ("division"), ("divorce"), ("DNA"), ("do"), ("doctor"), ("document"), ("dog"), ("domestic"), ("dominant"), ("dominate"), ("door"), ("double"), ("doubt"), ("down"), ("downtown"), ("dozen"), ("draft"), ("drag"), ("drama"), ("dramatic"), ("dramatically"), ("draw"), ("drawing"), ("dream"), ("dress"), ("drink"), ("drive"), ("driver"), ("drop"), ("drug"), ("dry"), ("due"), ("during"), ("dust"), ("duty"), ("each"), ("eager"), ("ear"), ("early"), ("earn"), ("earnings"), ("earth"), ("ease"), ("easily"), ("east"), ("eastern"), ("easy"), ("eat"), ("economic"), ("economics"), ("economist"), ("economy"), ("edge"), ("edition"), ("editor"), ("educate"), ("education"), ("educational"), ("educator"), ("effect"), ("effective"), ("effectively"), ("efficiency"), ("efficient"), ("effort"), ("egg"), ("eight"), ("either"), ("elderly"), ("elect"), ("election"), ("electric"), ("electricity"), ("electronic"), ("element"), ("elementary"), ("eliminate"), ("elite"), ("else"), ("elsewhere"), ("e-mail"), ("embrace"), ("emerge"), ("emergency"), ("emission"), ("emotion"), ("emotional"), ("emphasis"), ("emphasize"), ("employ"), ("employee"), ("employer"), ("employment"), ("empty"), ("enable"), ("encounter"), ("encourage"), ("end"), ("enemy"), ("energy"), ("enforcement"), ("engage"), ("engine"), ("engineer"), ("engineering"), ("English"), ("enhance"), ("enjoy"), ("enormous"), ("enough"), ("ensure"), ("enter"), ("enterprise"), ("entertainment"), ("entire"), ("entirely"), ("entrance"), ("entry"), ("environment"), ("environmental"), ("episode"), ("equal"), ("equally"), ("equipment"), ("era"), ("error"), ("escape"), ("especially"), ("essay"), ("essential"), ("essentially"), ("establish"), ("establishment"), ("estate"), ("estimate"), ("etc"), ("ethics"), ("ethnic"), ("European"), ("evaluate"), ("evaluation"), ("even"), ("evening"), ("event"), ("eventually"), ("ever"), ("every"), ("everybody"), ("everyday"), ("everyone"), ("everything"), ("everywhere"), ("evidence"), ("evolution"), ("evolve"), ("exact"), ("exactly"), ("examination"), ("examine"), ("example"), ("exceed"), ("excellent"), ("except"), ("exception"), ("exchange"), ("exciting"), ("executive"), ("exercise"), ("exhibit"), ("exhibition"), ("exist"), ("existence"), ("existing"), ("expand"), ("expansion"), ("expect"), ("expectation"), ("expense"), ("expensive"), ("experience"), ("experiment"), ("expert"), ("explain"), ("explanation"), ("explode"), ("explore"), ("explosion"), ("expose"), ("exposure"), ("express"), ("expression"), ("extend"), ("extension"), ("extensive"), ("extent"), ("external"), ("extra"), ("extraordinary"), ("extreme"), ("extremely"), ("eye"), ("fabric"), ("face"), ("facility"), ("fact"), ("factor"), ("factory"), ("faculty"), ("fade"), ("fail"), ("failure"), ("fair"), ("fairly"), ("faith"), ("fall"), ("false"), ("familiar"), ("family"), ("famous"), ("fan"), ("fantasy"), ("far"), ("farm"), ("farmer"), ("fashion"), ("fast"), ("fat"), ("fate"), ("father"), ("fault"), ("favor"), ("favorite"), ("fear"), ("feature"), ("federal"), ("fee"), ("feed"), ("feel"), ("feeling"), ("fellow"), ("female"), ("fence"), ("few"), ("fewer"), ("fiber"), ("fiction"), ("field"), ("fifteen"), ("fifth"), ("fifty"), ("fight"), ("fighter"), ("fighting"), ("figure"), ("file"), ("fill"), ("film"), ("final"), ("finally"), ("finance"), ("financial"), ("find"), ("finding"), ("fine"), ("finger"), ("finish"), ("fire"), ("firm"), ("first"), ("fish"), ("fishing"), ("fit"), ("fitness"), ("five"), ("fix"), ("flag"), ("flame"), ("flat"), ("flavor"), ("flee"), ("flesh"), ("flight"), ("float"), ("floor"), ("flow"), ("flower"), ("fly"), ("focus"), ("folk"), ("follow"), ("following"), ("food"), ("foot"), ("football"), ("for"), ("force"), ("foreign"), ("forest"), ("forever"), ("forget"), ("form"), ("formal"), ("formation"), ("former"), ("formula"), ("forth"), ("fortune"), ("forward"), ("found"), ("foundation"), ("founder"), ("four"), ("fourth"), ("frame"), ("framework"), ("free"), ("freedom"), ("freeze"), ("French"), ("frequency"), ("frequent"), ("frequently"), ("fresh"), ("friend"), ("friendly"), ("friendship"), ("from"), ("front"), ("fruit"), ("frustration"), ("fuel"), ("full"), ("fully"), ("fun"), ("function"), ("fund"), ("fundamental"), ("funding"), ("funeral"), ("funny"), ("furniture"), ("furthermore"), ("future"), ("gain"), ("galaxy"), ("gallery"), ("game"), ("gang"), ("gap"), ("garage"), ("garden"), ("garlic"), ("gas"), ("gate"), ("gather"), ("gay"), ("gaze"), ("gear"), ("gender"), ("gene"), ("general"), ("generally"), ("generate"), ("generation"), ("genetic"), ("gentleman"), ("gently"), ("German"), ("gesture"), ("get"), ("ghost"), ("giant"), ("gift"), ("gifted"), ("girl"), ("girlfriend"), ("give"), ("given"), ("glad"), ("glance"), ("glass"), ("large"), ("largely"), ("last"), ("late"), ("later"), ("Latin"), ("latter"), ("laugh"), ("launch"), ("law"), ("lawn"), ("lawsuit"), ("lawyer"), ("lay"), ("layer"), ("lead"), ("leader"), ("leadership"), ("leading"), ("leaf"), ("league"), ("lean"), ("learn"), ("learning"), ("least"), ("leather"), ("leave"), ("left"), ("leg"), ("legacy"), ("legal"), ("legend"), ("legislation"), ("legitimate"), ("lemon"), ("length"), ("less"), ("lesson"), ("let"), ("letter"), ("level"), ("liberal"), ("library"), ("license"), ("lie"), ("life"), ("lifestyle"), ("lifetime"), ("lift"), ("light"), ("like"), ("likely"), ("limit"), ("limitation"), ("limited"), ("line"), ("link"), ("lip"), ("list"), ("listen"), ("literally"), ("literary"), ("literature"), ("little"), ("live"), ("living"), ("load"), ("loan"), ("local"), ("locate"), ("location"), ("lock"), ("long"), ("long-term"), ("look"), ("loose"), ("lose"), ("loss"), ("lost"), ("lot"), ("lots"), ("loud"), ("love"), ("lovely"), ("lover"), ("low"), ("lower"), ("luck"), ("lucky"), ("lunch"), ("lung"), ("machine"), ("mad"), ("magazine"), ("mail"), ("main"), ("mainly"), ("maintain"), ("maintenance"), ("major"), ("majority"), ("make"), ("maker"), ("makeup"), ("male"), ("mall"), ("man"), ("manage"), ("management"), ("manager"), ("manner"), ("manufacturer"), ("manufacturing"), ("many"), ("map"), ("margin"), ("mark"), ("market"), ("marketing"), ("marriage"), ("married"), ("marry"), ("mask"), ("mass"), ("massive"), ("master"), ("match"), ("material"), ("math"), ("matter"), ("may"), ("maybe"), ("mayor"), ("me"), ("meal"), ("mean"), ("meaning"), ("meanwhile"), ("measure"), ("measurement"), ("meat"), ("mechanism"), ("media"), ("medical"), ("medication"), ("medicine"), ("medium"), ("meet"), ("meeting"), ("member"), ("membership"), ("memory"), ("mental"), ("mention"), ("menu"), ("mere"), ("merely"), ("mess"), ("message"), ("metal"), ("meter"), ("method"), ("Mexican"), ("middle"), ("might"), ("military"), ("milk"), ("million"), ("mind"), ("mine"), ("selection"), ("self"), ("sell"), ("Senate"), ("senator"), ("send"), ("senior"), ("sense"), ("sensitive"), ("sentence"), ("separate"), ("sequence"), ("series"), ("serious"), ("seriously"), ("serve"), ("service"), ("session"), ("set"), ("setting"), ("settle"), ("settlement"), ("seven"), ("several"), ("severe"), ("sex"), ("sexual"), ("shade"), ("shadow"), ("shake"), ("shall"), ("shape"), ("share"), ("sharp"), ("she"), ("sheet"), ("shelf"), ("shell"), ("shelter"), ("shift"), ("shine"), ("ship"), ("shirt"), ("shit"), ("shock"), ("shoe"), ("shoot"), ("shooting"), ("shop"), ("shopping"), ("shore"), ("short"), ("shortly"), ("shot"), ("should"), ("shoulder"), ("shout"), ("show"), ("shower"), ("shrug"), ("shut"), ("sick"), ("side"), ("sigh"), ("sight"), ("sign"), ("signal"), ("significance"), ("significant"), ("significantly"), ("silence"), ("silent"), ("silver"), ("similar"), ("similarly"), ("simple"), ("simply"), ("sin"), ("since"), ("sing"), ("singer"), ("single"), ("sink"), ("sir"), ("sister"), ("sit"), ("site"), ("situation"), ("six"), ("size"), ("ski"), ("skill"), ("skin"), ("sky"), ("slave"), ("sleep"), ("slice"), ("slide"), ("slight"), ("slightly"), ("slip"), ("slow"), ("slowly"), ("small"), ("smart"), ("smell"), ("smile"), ("smoke"), ("smooth"), ("snap"), ("snow"), ("so"), ("so-called"), ("soccer");

-- Init one respondent
INSERT INTO `respondent`
    (`age`, `gender`, `education`, `country_of_birth`, `country_of_residence`,
    `ethnicity`, `is_native`, `language_spoken`, `start_time`, `end_time`, `email`)
VALUES (20, "male", "A Level", "Singapore", "Singapore", "Chinese", "yes", "English",
         "2021-02-03 08:00:00", "2021-02-03 08:20:00", "example@gmail.com");

-- Init one answer
INSERT INTO `answer` (`association1`, `association2`, `association3`, `time_spend`, `question_id`, `respondent_id`)
VALUES ("final", "exam", "", 20000, 3, 1);
