--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Postgres.app)
-- Dumped by pg_dump version 17.5 (Postgres.app)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = ''UTF8'';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config(''search_path'', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coffees; Type: TABLE; Schema: public; Owner: jean-pierrebenavidescruzatte
--

CREATE TABLE public.coffees (
    "Unnamed: 0" bigint,
    id bigint,
    lat double precision,
    lon double precision,
    city character varying(255),
    housenumber character varying(255),
    state character varying(255),
    street character varying(255),
    name character varying(255),
    phone character varying(255),
    capacity double precision,
    postcode character varying(255),
    email character varying(255),
    postal_code double precision,
    instagram character varying(255),
    twitter character varying(255),
    location character varying(255),
    addr double precision
);


ALTER TABLE public.coffees OWNER TO "jean-pierrebenavidescruzatte";

--
-- Data for Name: coffees; Type: TABLE DATA; Schema: public; Owner: jean-pierrebenavidescruzatte
--

COPY public.coffees ("Unnamed: 0", id, lat, lon, city, housenumber, state, street, name, phone, capacity, postcode, email, postal_code, instagram, twitter, location, addr) FROM stdin;
0	418520887	40.636934	-74.076656	Staten Island	208	NY	Bay Street	Everything Goes Book Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	419360003	40.6647223	-73.9895351	\N	\N	\N	\N	La Fondita	+1-718-600-9884	\N	\N	\N	\N	\N	\N	\N	\N
2	419360064	40.6901914	-73.9935675	\N	\N	\N	\N	Mocha Hookah	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	419367394	40.7477067	-73.9772631	\N	\N	\N	\N	Perk Kafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	419367529	40.810011	-73.9431823	\N	\N	\N	\N	Lenox Coffee	\N	2	\N	\N	\N	\N	\N	\N	\N
5	534997494	40.6611342	-73.9902727	\N	652	\N	6th Avenue	Southside Coffee	+1-347-599-2884	\N	11215	\N	\N	\N	\N	\N	\N
6	560636265	40.7032771	-74.0141339	New York	1	NY	Battery Park Plaza	Starbucks	+1 212-482-1180	\N	10004	\N	\N	\N	\N	\N	\N
7	561239802	40.7481687	-73.9766084	\N	564	\N	3rd Avenue	Cafe Delecctica	\N	\N	10016	\N	\N	\N	\N	\N	\N
8	662894338	40.7522171	-73.9911323	New York	225	NY	West 35th Street	Best Bagel & Coffee	+1 212-564-4409	10	10001	bestbagel@gmail.com	\N	\N	\N	\N	\N
9	663070723	40.757084	-73.977893	New York	6	NY	East 48th Street	Toasties	+1 212-230-1320	\N	\N	\N	\N	\N	\N	\N	\N
10	663355907	40.7786106	-73.9606629	\N	\N	\N	\N	City Market Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	672800424	40.725087	-73.9777631	\N	700	\N	East 9th Street	9th St Espresso	\N	\N	10009	\N	\N	\N	\N	\N	\N
12	702331265	40.6430379	-74.1043496	\N	\N	\N	\N	Café Botanica	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	746176794	40.7938416	-73.9727702	New York	2525	NY	Broadway	Starbucks	+1 212-316-0374	\N	10025	\N	\N	\N	\N	\N	\N
14	835414667	40.8052757	-73.9624308	\N	1090	\N	Amsterdam Avenue	Niko Coffee	+1-212-666-3744	\N	\N	\N	\N	\N	\N	\N	\N
15	870317225	40.7593049	-73.952923	New York	455	NY	Main Street	Starbucks	+1 212-371-1298	\N	10044	\N	\N	\N	\N	\N	\N
16	883181314	40.7491	-73.983903	New York	373	NY	5th Avenue	Starbucks	+1 212-213-5363	\N	10016	\N	\N	\N	\N	\N	\N
17	883235940	40.7481846	-73.985687	New York	350	NY	5th Avenue	Starbucks	+1 212-564-9141	\N	10118	\N	\N	\N	\N	\N	\N
18	886175538	40.7254132	-73.992406	\N	1	\N	Bleecker Street	Think Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	886702490	40.7272065	-73.9954808	\N	665	\N	Broadway	Starbucks	+1-917-534-0799	\N	\N	\N	\N	\N	\N	\N	\N
20	888984017	40.7174274	-73.9583326	Brooklyn	198	NY	Bedford Avenue	Doughnut Plant	\N	\N	11249	\N	\N	\N	\N	\N	\N
21	889080115	40.7149297	-74.0110479	\N	\N	\N	\N	Twin Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	889083044	40.7151714	-74.0110643	\N	275	\N	Greenwich Street	Kaffe 1668	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	889261891	40.7145898	-74.0151484	New York	102	\N	North End Avenue	Pick-a-Bagel	\N	\N	10282	\N	\N	\N	\N	\N	\N
24	889469733	40.7149567	-74.0094239	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	889472802	40.715522	-74.008983	New York	125	NY	Chambers Street	Starbucks	+1 212-791-6368	\N	10007	\N	\N	\N	\N	\N	\N
26	1020359759	40.780542	-73.954568	\N	1309	\N	Lexington Avenue	Le Pain Quotidien	+1 212-203-0802	\N	10128	\N	\N	\N	\N	\N	\N
27	1025322222	40.7246121	-73.9843772	\N	\N	\N	\N	Cafe Social 68	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	1028101219	40.7579727	-73.9232898	\N	\N	\N	\N	Citrico Cafe & Agaveria Bar	718-255-1705	\N	\N	\N	\N	\N	\N	\N	\N
29	1240901204	40.7671831	-73.9720578	\N	\N	\N	\N	Dancing Crane Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	1292790745	40.7504996	-73.9791604	New York	90	NY	Park Avenue	Starbucks	+1 212-661-5489	\N	10016	\N	\N	\N	\N	\N	\N
31	1292819650	40.7518527	-73.9775605	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	1379559786	40.6825167	-73.9793167	\N	57	\N	4th Avenue	Canteen Delicatessen & Cafe	+1 718 789 2133	\N	\N	\N	\N	\N	\N	\N	\N
33	1383909693	40.767389	-73.9814374	\N	\N	\N	\N	Le Pain Quotidien	+13329106866	\N	\N	\N	\N	\N	\N	\N	\N
34	1383935070	40.7669811	-73.9840167	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	1383935410	40.7675105	-73.9829426	New York	4	NY	Columbus Circle	Starbucks	+1-212-265-0658	\N	10019	\N	\N	\N	\N	\N	\N
36	1383942697	40.7676336	-73.9812871	New York	240	NY	Central Park South	Starbucks	+1-718-635-9564	\N	10019	\N	\N	\N	\N	\N	\N
37	1383954690	40.7649496	-73.979109	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	1383955011	40.7654404	-73.9803003	\N	\N	\N	\N	Cafe Metro	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	1422520991	40.7200059	-73.9600762	Brooklyn	150	NY	Wythe Avenue	Bakeri	\N	\N	11249	\N	\N	\N	\N	\N	\N
40	1426250385	40.7566623	-73.9858678	New York	1500	NY	Broadway	Starbucks	+1 212-221-7515	\N	10036	\N	\N	\N	\N	\N	\N
41	1426275725	40.7566921	-73.9867194	New York	3	\N	Times Square	Europa Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	1427265079	40.7539377	-73.9768745	\N	\N	\N	\N	The Beer Bar Cafe Centro	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	1427265082	40.7543596	-73.9763714	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	1427265083	40.7538356	-73.9761648	\N	\N	\N	\N	Naples 45	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	1427273332	40.7529578	-73.9752216	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	1427273368	40.7523179	-73.9738176	\N	\N	\N	\N	Maman	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	1427285902	40.7520527	-73.9759313	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	1427286079	40.750611	-73.9768239	\N	370	\N	Lexington Avenue	Zuckers Bagels & Smoked Fish	+1-212-661-1080	\N	10017	\N	\N	\N	\N	\N	\N
49	1427286257	40.7519302	-73.978195	\N	\N	\N	\N	Central Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	1427499765	40.7519234	-73.9797222	New York	295	NY	Madison Avenue	Starbucks	\N	\N	10017	\N	\N	\N	\N	\N	\N
51	1428036328	40.7528897	-73.9811056	\N	\N	\N	\N	Andaz	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	1428036650	40.7545385	-73.9840441	\N	\N	\N	\N	Wafels and Dinges	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	1428185672	40.7490233	-73.9822288	New York	200	NY	Madison Avenue	Starbucks	+1 212-684-6873	\N	10016	\N	\N	\N	\N	\N	\N
54	1428185707	40.7433913	-73.9892649	New York	1123	\N	Broadway	Broadway Cafe	+1-212-727-9797	\N	10010	\N	\N	\N	\N	\N	\N
55	1428427548	40.7538901	-73.9787699	New York	340	NY	Madison Avenue	Starbucks	+1 212-867-0928	\N	10173	\N	\N	\N	\N	\N	\N
56	1428427554	40.7570782	-73.9759556	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	1428427562	40.7613683	-73.9737843	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	1490626144	40.679722	-73.9780478	\N	\N	\N	\N	Clever Blend	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	1584932886	40.7444662	-73.9747193	\N	\N	\N	\N	El Parador Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	1584932953	40.7436871	-73.9769314	New York	585	NY	2nd Avenue	Starbucks	+1 212-684-1299	\N	10016	\N	\N	\N	\N	\N	\N
61	1640916377	40.6764594	-73.9625671	\N	\N	\N	\N	Aura	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	1666603088	40.80593	-73.9545289	New York	2195	NY	Frederick Douglass Boulevard	Starbucks	+1 212-662-1239	\N	10026	\N	\N	\N	\N	\N	\N
63	1706038616	40.7557338	-73.9824831	\N	\N	\N	\N	Gregory Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	1707825822	40.7544373	-73.9953011	\N	462	\N	9th Avenue	Sushi Star	+1 212-279-1010	\N	10018	sushistarny@gmail.com	\N	\N	\N	\N	\N
65	1707825823	40.754189	-73.9954886	\N	454	\N	9th Avenue	Starstruck Coffee	+1 3479125500	\N	10018	info@starstruckcoffee.org	\N	\N	\N	\N	\N
66	1737296859	40.7202016	-74.0139829	New York	\N	NY	\N	Sweet Love Snack Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	1754412984	40.7330073	-73.9897302	New York	123	NY	4th Avenue	Think Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
68	1754975219	40.7420998	-73.9196581	\N	45-01	\N	Greenpoint Avenue	Ave Coffee House	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	1767273825	40.7002323	-73.9933602	\N	\N	\N	\N	Tutt Café	+1-718-722-7777	\N	\N	\N	\N	\N	\N	\N	\N
70	1767282008	40.6995716	-73.9921353	\N	\N	\N	\N	Poppys Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	1770858847	40.669376	-73.9630352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	1795796594	40.6777429	-73.9686298	\N	645	\N	Vanderbilt Avenue	Olde Brooklyn Bagel Shoppe	+1-718-622-6227	7	11238	\N	\N	\N	\N	\N	\N
73	1802885415	40.7562302	-73.9750931	New York	280	NY	Park Avenue	Starbucks	+1 917-723-0193	\N	10172	\N	\N	\N	\N	\N	\N
74	1810737611	40.7952322	-73.9655391	New York	805	NY	Columbus Avenue	Starbucks	+1 212-222-6582	\N	10025	\N	\N	\N	\N	\N	\N
75	1821015958	40.7879675	-73.9764443	New York	2350	NY	Broadway	Broad Nosh Bagel	+1-212-600-0933	\N	10025	\N	\N	\N	\N	\N	\N
76	1821015965	40.7883801	-73.977098	New York	250	NY	West 86th Street	The Crossbar	+1 212-580-8923	\N	10024	\N	\N	\N	\N	\N	\N
77	1825739845	40.739372	-74.002526	New York	122	NY	Greenwich Avenue	Starbucks	+1 212-366-4672	\N	10011	\N	\N	\N	\N	\N	\N
78	1827182566	40.6784602	-73.9641499	\N	\N	\N	\N	The Bakery on Bergen	+1-917-519-6549	\N	\N	\N	\N	\N	\N	\N	\N
79	1853451181	40.739495	-74.0029857	New York	73	NY	8th Avenue	Think Coffee	\N	\N	10014	\N	\N	\N	\N	\N	\N
80	1865211623	40.7224661	-73.9488216	\N	277	\N	Driggs Avenue	Uro Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	1868984359	40.7337954	-74.0064644	\N	518	\N	Hudson Street	Starbucks	\N	\N	10014	\N	\N	\N	\N	\N	\N
82	1899033653	40.7580159	-73.9889989	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	1900975316	40.7644259	-73.9810737	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	1917136131	40.719348	-73.9899978	New York	80	NY	Delancey Street	Starbucks	+1 917-534-1397	\N	10002	\N	\N	\N	\N	\N	\N
85	1919602938	40.7235092	-73.9913293	\N	\N	\N	\N	La Colombe Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	1967406009	40.8109307	-73.9428375	New York	404	NY	Lenox Avenue	Astor Row Cafe	\N	\N	10037	\N	\N	\N	\N	\N	\N
87	1979669269	40.7141835	-73.9616239	Brooklyn	300	NY	Bedford Avenue	Black Brick	\N	\N	11211	\N	\N	\N	\N	\N	\N
88	1994680562	40.7849274	-73.9788012	New York	2252	NY	Broadway	Starbucks	+1 212-721-1267	\N	10024	\N	\N	\N	\N	\N	\N
89	1999231230	40.7117855	-73.9514399	\N	379	\N	Union Avenue	The West	\N	\N	11211	\N	\N	\N	\N	\N	\N
90	2011782281	40.7082349	-74.0076153	New York	90	NY	William Street	BlueSpoon Coffee Co	+1 212-809-8880	\N	10038	\N	\N	\N	\N	\N	\N
91	2017709329	40.73749	-73.87685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	2020487652	40.7364693	-73.9790705	\N	\N	\N	\N	Möge Tee	+1-646-370-5846	\N	\N	\N	\N	\N	\N	\N	\N
93	2020724922	40.7375845	-74.0001443	New York	35	NY	7th Avenue	Whole Green	\N	\N	10011	\N	\N	\N	\N	\N	\N
94	2033946685	40.7072305	-74.0123877	\N	\N	\N	\N	Bean And Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	2034011016	40.7043817	-74.0130472	New York	2	NY	Broadway	Starbucks	+1 212-344-4290	\N	10004	\N	\N	\N	\N	\N	\N
96	2039276429	40.9065782	-73.9044152	\N	\N	\N	\N	Carlos and Gabbys	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	2041169444	40.8735418	-73.9084923	New York	40	NY	West 225th Street	Starbucks	+1 718-733-7199	\N	10463	\N	\N	\N	\N	\N	\N
98	2045635524	40.7401504	-73.984507	\N	38B	\N	Lexington Avenue	CoCo Fresh Tea & Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	2045635529	40.7405189	-73.984262	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	2047269475	40.7101916	-74.0079702	New York	130	NY	Fulton Street	Starbucks	+1 212-962-0439	\N	10038	\N	\N	\N	\N	\N	\N
101	2065455029	40.722517	-73.997904	New York	72	\N	Spring Street	Starbucks	+1-212-219-2961	\N	10002	\N	\N	\N	\N	\N	\N
102	2066808156	40.760478	-73.9218592	Astoria	35-05	\N	Broadway	Brooklyn Bagel	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	2091641953	40.8010232	-73.9587555	New York	301	NY	Cathedral Parkway	Cafe Amrita	+1-212-222-0683	\N	10026	\N	\N	\N	\N	\N	\N
104	2109918801	40.725584	-73.9947398	New York	337	NY	Lafayette Street	Bite	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	2139130920	40.6917184	-73.9711843	\N	\N	\N	\N	Peckish	+1-929-387-8188	\N	\N	\N	\N	\N	\N	\N	\N
106	2178336350	40.7212256	-73.984094	New York	3	NY	Clinton Street	Pause Cafe	+1-212-677-5415	\N	10002	\N	\N	\N	\N	\N	\N
107	2178743034	40.757236	-73.9891169	Port Authority	625	NY	Eighth Avenue	Starbucks	+1 212-273-9613	\N	10018	\N	\N	\N	\N	\N	\N
108	2183010458	40.7059471	-74.0116452	\N	40	\N	Broad Street	Joe & The Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	2183010462	40.7035248	-74.0108884	\N	66	\N	Pearl Street	787 Coffee	+1 646-449-9200	\N	10004	\N	\N	\N	\N	\N	\N
110	2183010472	40.7037137	-74.0104781	New York	74	NY	Pearl Street	Springbone Kitchen	+1-917-639-3655	\N	10004	\N	\N	\N	\N	\N	\N
111	2183010488	40.7051728	-74.011298	New York	55	NY	Broad Street	Starbucks	+1 212-742-2490	\N	10004	\N	\N	\N	\N	\N	\N
112	2186522367	40.7068069	-74.0085989	\N	\N	\N	\N	Taz Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	2186605427	40.7471411	-73.9560426	\N	4615	\N	Center Boulevard	Sweetleaf	\N	\N	11109	\N	\N	\N	\N	\N	\N
114	2186614190	40.7046071	-74.0091159	New York	110	NY	Pearl Street	Starbucks	+1 212-482-6530	\N	10005	\N	\N	\N	\N	\N	\N
115	2192591869	40.7127224	-73.9570033	Brooklyn	314	NY	Grand Street	For All Things Good	+1 646 238 2068	\N	11211	\N	\N	\N	\N	\N	\N
116	2195218439	40.7924179	-73.9738031	New York	2481	NY	Broadway	Moka	\N	\N	10025	\N	\N	\N	\N	\N	\N
117	2259012625	40.6814376	-73.9346162	\N	\N	\N	\N	Brooklyn Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	2268953602	40.734967	-73.9582704	Brooklyn	258	NY	Franklin Street	Eagle Trading Company	+1-718-576-3217	\N	11222	\N	\N	\N	\N	\N	\N
119	2268954021	40.7296813	-73.9581821	Brooklyn	70	NY	Greenpoint Avenue	Kettl	+1-917-909-1309	\N	11222	\N	\N	\N	\N	\N	\N
120	2268954771	40.6976119	-73.9361072	\N	\N	\N	\N	Skytown	+1-347-435-3252	\N	\N	\N	\N	\N	\N	\N	\N
121	2274110508	40.7054406	-73.9334626	Brooklyn	49	NY	Bogart Street	Swallow Cafe	\N	\N	11206	\N	\N	\N	\N	\N	\N
122	2274489113	40.7095666	-73.8302846	Kew Gardens	82-60	NY	Austin Street	Roast & Co	\N	\N	11415	\N	\N	\N	\N	\N	\N
123	2274508178	40.7090136	-73.8299789	Kew Gardens	81-09	NY	Lefferts Boulevard	Bakers Dozen Bagels	\N	\N	11415	\N	\N	\N	\N	\N	\N
124	2276315902	40.7341833	-73.9550701	\N	\N	\N	\N	Little Armenia	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	2279508475	40.7308318	-73.983183	\N	219	\N	1st Avenue	Starbucks	\N	\N	10003	\N	\N	\N	\N	\N	\N
126	2294802411	40.7602221	-73.9750354	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	2296374964	40.7175527	-73.9411987	Brooklyn	135	\N	Woodpoint Road	Tar Pit	+1 917-705-8031	\N	11211	\N	\N	\N	\N	\N	\N
128	2303950107	40.7851171	-73.9766494	New York	461	NY	Amsterdam Avenue	Chalait	\N	\N	10024	\N	\N	\N	\N	\N	\N
129	2304436416	40.6904311	-73.9944268	\N	200	\N	Clinton Street	Bagel Cafe	+1-718-254-9000	\N	11201	\N	\N	\N	\N	\N	\N
130	2307164608	40.7468389	-73.9933857	\N	\N	\N	\N	GiGi Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	2308955289	40.8101961	-73.9618962	New York	550	NY	West 120th Street	Joe Coffee Company	+1-212-924-7400	125	10027	\N	\N	\N	\N	\N	\N
132	2310498477	40.771384	-73.9824717	New York	1889	NY	Broadway	Starbucks	+1-212-245-1362	\N	10023	\N	\N	\N	\N	\N	\N
133	2338757145	40.7932055	-73.9675462	New York	750	NY	Columbus Avenue	Birch Coffee	\N	\N	10025	96thstreet@birchcoffee.com	\N	\N	\N	\N	\N
134	2340960566	40.808949	-73.9609388	\N	\N	\N	\N	Uris Deli	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	2340960685	40.8094957	-73.9602878	\N	\N	\N	\N	Blue Java	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	2357937257	40.7761432	-73.9502069	New York	1631	NY	1st Avenue	Starbucks	+1 212-737-6534	\N	10028	\N	\N	\N	\N	\N	\N
137	2357937268	40.7859465	-73.9507027	New York	1491	NY	Lexington Avenue	Starbucks	+1 212-369-0313	\N	10029	\N	\N	\N	\N	\N	\N
138	2358048509	40.7333179	-74.0005572	New York	141	NY	Waverly Place	Joe Coffee Company	+1 212-924-6750	\N	10014	\N	\N	\N	\N	\N	\N
139	2358048512	40.7332121	-74.0026862	New York	74	NY	Grove Street	Starbucks	\N	\N	10014	\N	\N	\N	\N	\N	\N
140	2377128136	40.7461544	-73.9975859	New York	286	NY	8th Avenue	Brooklyn Bagel & Coffee Company	\N	\N	10001	\N	\N	\N	\N	\N	\N
141	2377128148	40.7439702	-73.9997102	New York	211	NY	8th Avenue	St Kilda Coffee	\N	\N	10011	info@stkildacoffee.com	\N	\N	\N	\N	\N
142	2377128172	40.7447814	-73.9985854	New York	500	NY	6th Avenue	Zuckers	\N	\N	10011	\N	\N	\N	\N	\N	\N
143	2377128180	40.7411054	-74.0012613	New York	124	NY	8th Avenue	Starbucks	+1 212-462-2020	\N	10011	\N	\N	\N	\N	\N	\N
144	2377128182	40.7451876	-73.9988416	New York	300	NY	West 23rd Street	Starbucks	+1 646-638-1571	\N	10011	\N	\N	\N	\N	\N	\N
145	2384821679	40.7384873	-74.0000074	\N	\N	\N	\N	Bagel and More	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	2384821772	40.7388452	-73.9998143	New York	203	NY	West 14th Street	The Donut Pub	\N	\N	10001	\N	\N	\N	\N	\N	\N
147	2409398832	40.7857253	-73.9729983	New York	514	NY	Columbus Avenue	Joe Coffee Company	+1 212-875-0100	\N	10024	\N	\N	\N	\N	\N	\N
148	2414094417	40.7822907	-73.9792081	New York	368	NY	Amsterdam Avenue	Bagel Talk	+1-212-875-1267	\N	10024	\N	\N	\N	\N	\N	\N
149	2422377040	40.7131024	-73.9623534	Brooklyn	328	\N	Bedford Avenue	Oslo Coffee Roasters	\N	\N	11211	\N	\N	\N	\N	\N	\N
150	2423037502	40.761405	-73.9678672	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	2423176814	40.7694073	-73.9848933	New York	2	NY	Columbus Avenue	Starbucks	+1 212-489-6757	\N	10023	\N	\N	\N	\N	\N	\N
152	2438940207	40.7871147	-73.9719656	New York	556	NY	Columbus Avenue	Columbus Cafe	+1-212-721-9040	\N	10024	\N	\N	\N	\N	\N	\N
153	2439082123	40.7179682	-73.9591782	\N	125	\N	North 6th Street	Partners Coffee	+1 347-586-0063	\N	11249	\N	\N	\N	\N	\N	\N
154	2443892139	40.7777547	-73.9826132	New York	2045	NY	Broadway	Starbucks	+1 212-496-1551	\N	10023	\N	\N	\N	\N	\N	\N
155	2460552261	40.6680649	-73.9877252	Brooklyn	318	NY	11th Street	Casita of Brooklyn	+1-347-889-5849	\N	11215	\N	\N	\N	\N	\N	\N
156	2486570141	40.7231858	-73.9901312	\N	137	\N	East Houston Street	Yonah Shimmel Knish Bakery	+1-212-477-2858	\N	10002	\N	\N	\N	\N	\N	\N
157	2493964408	40.6468222	-73.9700366	\N	1007	\N	Church Avenue	LARK cafe	\N	\N	11218	\N	\N	\N	\N	\N	\N
158	2494066985	40.6909413	-73.9962942	\N	119	\N	Atlantic Avenue	Salter House	+1-347-987-4675	\N	11201	\N	\N	\N	\N	\N	\N
159	2494067738	40.6912914	-73.997559	\N	79	\N	Atlantic Avenue	Diem Eatery	+1-917-909-1037	\N	11201	\N	\N	\N	\N	\N	\N
160	2494071345	40.6837765	-73.9541584	\N	1180	\N	Bedford Avenue	Napoleons Southern Cuisine & Bakery	+1-347-663-3069	\N	11216	\N	\N	\N	\N	\N	\N
161	2494104052	40.6475187	-73.973854	\N	622	\N	Caton Avenue	Parade Café	\N	\N	11218	\N	\N	\N	\N	\N	\N
162	2494127828	40.7268178	-73.9887455	\N	88	\N	2nd Avenue	Sunflower	\N	\N	10003	\N	\N	\N	\N	\N	\N
163	2494208354	40.6722202	-73.9835759	\N	337	\N	5th Avenue	Hungry Ghost	\N	\N	11215	\N	\N	\N	\N	\N	\N
164	2494221616	40.6767302	-73.9559227	\N	942	\N	Bergen Street	Word of Mouth	\N	\N	11238	\N	\N	\N	\N	\N	\N
165	2494226535	40.6738326	-73.9822047	Brooklyn	279	\N	5th Avenue	Velvette Brew Espresso Bar	\N	\N	11215	\N	\N	\N	\N	\N	\N
166	2494243515	40.6847629	-73.9919462	\N	202	\N	Smith Street	Smith St. Bagels	+1 347-341-8192	\N	11201	\N	\N	\N	\N	\N	\N
167	2494245451	40.728772	-73.9877814	New York	133	NY	2nd Avenue	Xing Fu Tang	+1-718-799-0220	\N	10003	\N	\N	\N	\N	\N	\N
168	2494245665	40.7297726	-73.98948	New York	31	NY	3rd Avenue	The Bean	\N	\N	10003	\N	\N	\N	\N	\N	\N
169	2494279212	40.6375227	-73.9684934	\N	816	\N	Coney Island Avenue	Urgut Osh Markazi	+1-718-521-4343	\N	11218	\N	\N	\N	\N	\N	\N
170	2494291744	40.671195	-73.9884777	\N	205	\N	8th Street	Room No. 205	\N	\N	11215	\N	\N	\N	\N	\N	\N
171	2494312775	40.6982639	-73.9927853	\N	90	\N	Henry Street	Plymouth Café	+1-718-624-0074	\N	11201	\N	\N	\N	\N	\N	\N
172	2506680554	40.6789434	-73.9638264	\N	621	\N	Washington Avenue	Mooliauno’s Trapp Kitchen	\N	\N	11238	\N	\N	\N	\N	\N	\N
173	2522802832	40.7787541	-73.9141762	\N	\N	\N	\N	Gold N Honey	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	2522802835	40.779282	-73.9155723	\N	\N	\N	\N	Waltz Astoria	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	2522802848	40.7747031	-73.9084483	Astoria	\N	NY	Ditmars Boulevard	Brooklyn Bagel & Coffee Co.	\N	\N	11105	\N	\N	\N	\N	\N	\N
176	2522802854	40.7747988	-73.913727	\N	\N	\N	\N	New York City Bagel and Coffee House	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	2524539379	40.6862203	-73.9909614	Brooklyn	164	NY	Smith Street	Starbucks	+1 718-422-0178	\N	11201	\N	\N	\N	\N	\N	\N
178	2525593698	40.6358633	-73.9623411	\N	1514	\N	Newkirk Avenue	Coffee Mob	\N	\N	\N	info@coffeemob.com	\N	\N	\N	\N	\N
179	2545431426	40.5530397	-74.1927658	\N	262F	\N	Arden Avenue	Buddys Cafe Play Place	+1-347-562-4842	\N	10312	\N	\N	\N	\N	\N	\N
180	2546985590	40.7258624	-73.9898947	\N	57	\N	2nd Avenue	Kona Coffee and Company	\N	\N	10003	\N	\N	\N	\N	\N	\N
181	2547036417	40.726927	-73.9957148	\N	651	\N	Broadway	Grabensteins Bagels	\N	\N	10012	\N	\N	\N	\N	\N	\N
182	2547041086	40.7225241	-73.9934347	New York	1	NY	Prince Street	PlantShed	+1-212-662-4400	\N	10012	\N	\N	\N	\N	\N	\N
183	2547054885	40.7256046	-73.98962	\N	\N	\N	\N	The Bean	+1-917-262-0929	\N	\N	\N	\N	\N	\N	\N	\N
184	2547109169	40.7261039	-73.9987153	New York	145	NY	Greene Street	Felix Roasting Co.	\N	\N	10012	\N	\N	\N	\N	\N	\N
185	2547110379	40.7268477	-74.0001615	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	2547121461	40.7289718	-73.984521	New York	163	NY	1st Avenue	Gelatoville Gelataria	\N	\N	10003	\N	\N	\N	\N	\N	\N
187	2547121512	40.7289974	-73.984701	New York	241	NY	East 10th Street	Not as Bitter	+16469393129	\N	10003	hello@notasbitter.com	\N	\N	\N	\N	\N
188	2547155234	40.7304731	-73.9894757	\N	36	\N	3rd Avenue	Hidden Grounds	\N	\N	10003	\N	\N	\N	\N	\N	\N
189	2547162163	40.7301234	-73.9941159	New York	11	NY	Waverly Place	Lazy Sundaes	\N	\N	10003	\N	\N	\N	\N	\N	\N
190	2547162213	40.7302457	-73.9939666	New York	293	NY	Mercer Street	Matto Espresso	+13478828000	\N	10003	\N	\N	\N	\N	\N	\N
191	2547200395	40.7343881	-73.9910564	New York	841	NY	Broadway	Max Brenner	+1-646-467-8803	\N	10003	USQreservations@maxbrenner.com	\N	\N	\N	\N	\N
192	2547200402	40.7350879	-73.9933063	New York	9	\N	East 13th Street	Joe Coffee Company	+1 212-924-3300	\N	10003	\N	\N	\N	\N	\N	\N
193	2547241579	40.7213537	-73.9977481	\N	201	\N	Lafayette Street	Citizens	\N	\N	10012	\N	\N	\N	\N	\N	\N
194	2547241611	40.7239788	-73.9964591	\N	270	\N	Lafayette Street	La Colombe Coffee Roasters	\N	\N	10012	\N	\N	\N	\N	\N	\N
195	2547688765	40.625146	-73.9605679	Brooklyn	1520	NY	Avenue J	Starbucks	\N	\N	11230	\N	\N	\N	\N	\N	\N
196	2549884902	40.6986611	-73.99436	Brooklyn	102	NY	Hicks Street	Joe Coffee Company	\N	\N	11201	\N	\N	\N	\N	\N	\N
197	2549890557	40.6563523	-73.960214	\N	696C	\N	Flatbush Avenue	Loud Baby	+1-718-938-9782	\N	11226	\N	\N	\N	\N	\N	\N
198	2549893289	40.687511	-73.9979469	\N	402	\N	Henry Street	Fare & Folk	\N	\N	11201	\N	\N	\N	\N	\N	\N
199	2549908128	40.6553542	-73.9565051	\N	2024	\N	Bedford Avenue	Cups and Books	\N	\N	11226	\N	\N	\N	\N	\N	\N
200	2549911944	40.6789942	-73.9681778	\N	\N	\N	\N	Brooklyn High Low	+1-646-907-9467	\N	\N	\N	\N	\N	\N	\N	\N
201	2549918806	40.6894847	-73.9725415	\N	180	\N	DeKalb Avenue	Bittersweet	\N	\N	11205	\N	\N	\N	\N	\N	\N
202	2549928994	40.7273871	-73.9852333	\N	\N	\N	\N	The Wild Son Lunch Counter	+1-212-727-7900	\N	\N	\N	\N	\N	\N	\N	\N
203	2549948620	40.7445908	-73.988682	New York	1158	NY	Broadway	Cha Cha Matcha	\N	\N	10001	\N	\N	\N	\N	\N	\N
204	2549967215	40.6842945	-73.996843	\N	243	\N	Degraw Street	Poppys Cafe	+1-646-459-2716	\N	11231	\N	\N	\N	\N	\N	\N
205	2550007703	40.724302	-73.9912261	\N	\N	\N	\N	Kollectiv	+1-212-228-5909	\N	\N	\N	\N	\N	\N	\N	\N
206	2550022491	40.6805213	-73.9892924	\N	\N	\N	\N	Cafecito Social	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	2550046897	40.7299427	-73.999592	New York	240	NY	Sullivan Street	Third Rail Coffee	\N	\N	10012	\N	\N	\N	\N	\N	\N
208	2550051091	40.7338779	-74.0004371	\N	14	\N	Christopher Street	Whynot	\N	\N	10014	\N	\N	\N	\N	\N	\N
209	2550054002	40.6812527	-73.9756418	\N	210	\N	Flatbush Avenue	Thermostat	+1-347-677-3418	\N	11217	\N	\N	\N	\N	\N	\N
210	2550064303	40.6886044	-73.9834746	\N	276	\N	Livingston Street	Devoción	\N	\N	11217	\N	\N	\N	\N	\N	\N
211	2550074047	40.6747057	-73.9979228	Brooklyn	478	NY	Smith Street	Atelier Ariana	+1-718-614-3582	\N	11231	\N	\N	\N	\N	\N	\N
212	2550112121	40.710612	-73.7928298	Jamaica	169-02	NY	Hillside Avenue	Richie’s Place Coffee Shop	+1-718-297-4006	\N	11432	\N	\N	\N	\N	\N	\N
213	2550112949	40.7775475	-73.9784645	\N	261	\N	Columbus Avenue	72nd Eatery	+1-212-721-7800	\N	\N	\N	\N	\N	\N	\N	\N
214	2550140535	40.6811681	-73.9499172	\N	518	\N	Nostrand Avenue	Le Paris Dekar	\N	\N	11216	\N	\N	\N	\N	\N	\N
215	2550140538	40.6808601	-73.9498314	\N	524	\N	Nostrand Avenue	Brooklyn Tea	+1-347-240-4281	\N	11216	\N	\N	\N	\N	\N	\N
216	2550142989	40.6803577	-73.9466911	\N	\N	\N	\N	Le Paris Dekar	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	2550150589	40.6813832	-73.9575678	\N	\N	\N	\N	HealHaus Cafe	+1-347-413-7774	\N	\N	\N	\N	\N	\N	\N	\N
218	2550565259	40.6732806	-73.9830685	\N	\N	\N	\N	Simple Loaf	+1-347-384-2205	\N	\N	\N	\N	\N	\N	\N	\N
219	2550581361	40.6691315	-73.9894619	\N	\N	\N	\N	Maya & Camila Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	2550585168	40.6674284	-73.9881499	\N	276B	\N	12th Street	Daily Dose	\N	\N	11215	\N	\N	\N	\N	\N	\N
221	2550661504	40.5716024	-74.1121286	\N	314	\N	New Dorp Lane	Something Sweet	\N	\N	10306	\N	\N	\N	\N	\N	\N
222	2550901690	40.7080879	-73.8027719	Jamaica	159-03	NY	Hillside Avenue	Bubble Tea Garden	(718) 487-4814	\N	11432	\N	\N	\N	\N	\N	\N
223	2550990526	40.7285415	-73.7827809	\N	185-26	\N	Union Turnpike	Lulus	\N	\N	11366	\N	\N	\N	\N	\N	\N
224	2551696571	40.7265425	-73.789793	\N	178-07	\N	Union Turnpike	Cafe Musscat	\N	\N	11366	\N	\N	\N	\N	\N	\N
225	2552486455	40.6385548	-74.0354762	Brooklyn	10	NY	Bay Ridge Avenue	Pier 69 Market	\N	\N	11220	\N	\N	\N	\N	\N	\N
226	2552542724	40.6173362	-74.0333855	\N	9419	\N	3rd Avenue	Mr. Bagels Cafe	+1-718-836-3000	\N	11209	\N	\N	\N	\N	\N	\N
227	2552544634	40.617533	-74.033308	\N	9413	\N	3rd Avenue	Pep	+1-929-397-0094	\N	11209	\N	\N	\N	\N	\N	\N
228	2552595875	40.6212293	-74.0318014	Brooklyn	8901	NY	3rd Avenue	Panino Rustico	+1-718-333-5144	\N	11209	\N	\N	\N	\N	\N	\N
229	2552692643	40.631177	-74.0280699	\N	\N	\N	\N	Bagel Schmagel	+1-718-833-1774	\N	\N	\N	\N	\N	\N	\N	\N
230	2552708688	40.635594	-74.0262812	\N	\N	\N	\N	Felfa	+1-718-333-5570	\N	\N	\N	\N	\N	\N	\N	\N
231	2552775452	40.6358071	-74.0258393	\N	6823	\N	3rd Avenue	Cozy Spot	\N	\N	11220	\N	\N	\N	\N	\N	\N
232	2552908995	40.6289017	-74.0230572	\N	7526	\N	5th Avenue	Jean Danet Pastry	+1-718-737-7152	\N	11209	\N	\N	\N	\N	\N	\N
233	2552912772	40.7394038	-73.7855258	Fresh Meadows	61-51	NY	188th Street	Starbucks	+1 718-264-0658	\N	11365	\N	\N	\N	\N	\N	\N
234	2552942681	40.5782572	-73.9594472	Brooklyn	1001	\N	Brighton Beach Avenue	Maison De Viennoiseries	+1 347-492-6761	\N	11235	\N	\N	\N	\N	\N	\N
235	2552982111	40.6248571	-74.0243627	\N	8101	\N	5th Avenue	Maison De Viennoijevieg	\N	\N	11209	\N	\N	\N	\N	\N	\N
236	2553306722	40.7490519	-73.7560999	Oakland Gardens	221-04	NY	Horace Harding Expressway	Starbucks	+1 917-579-9415	\N	11364	\N	\N	\N	\N	\N	\N
237	2553343248	40.7407055	-73.7591127	\N	215-03	\N	73rd Avenue	Bagel Shoppe	\N	\N	11364	\N	\N	\N	\N	\N	\N
238	2553613124	40.6079569	-73.9592031	Brooklyn	1698	NY	East 14th Street	Gong Cha	+1-347-587-4500	\N	11229	\N	\N	\N	\N	\N	\N
239	2555098994	40.718849	-73.9966792	\N	147	\N	Mott Street	Haven Cafe	\N	\N	10013	\N	\N	\N	\N	\N	\N
240	2555099000	40.7195996	-73.9963707	\N	\N	\N	\N	Chiu Hong Bakery & Restaurant	+1-212-966-7664	\N	\N	\N	\N	\N	\N	\N	\N
241	2555120465	40.7218498	-74.0008229	New York	54	\N	Mercer Street	Bibliotheque Cafe & Winebar	\N	\N	10013	\N	\N	\N	\N	\N	\N
242	2555123830	40.7172462	-73.9950457	New York	145	NY	Hester Street	Teado Tea Shop	+1-212-226-7687	\N	10002	\N	\N	\N	\N	\N	\N
243	2555123886	40.7162569	-73.9950007	\N	51	\N	Chrystie Street	Yaya Tea Garden	+1-212-226-8803	\N	10002	\N	\N	\N	\N	\N	\N
244	2555126595	40.7196388	-73.9895629	New York	127	NY	Orchard Street	Russ & Daughters Cafe	+1-212-475-4880	\N	10002	cafe@russanddaughters.com	\N	\N	\N	\N	\N
245	2555136029	40.7399221	-73.9893996	\N	922	\N	Broadway	Cha Cha Matcha	\N	\N	10010	\N	\N	\N	\N	\N	\N
246	2555137420	40.7364478	-73.9909744	\N	29	\N	Union Square West	Joe Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
247	2555580688	40.7437268	-73.9814828	\N	\N	\N	\N	Penelope	\N	\N	\N	\N	\N	\N	\N	\N	\N
248	2555945169	40.6002149	-73.9856777	Brooklyn	1901	NY	Stillwell Avenue	Wild Bagels	\N	\N	11223	\N	\N	\N	\N	\N	\N
249	2555989806	40.6003745	-73.9915601	Brooklyn	2300	NY	86th Street	Kung Fu Tea	\N	\N	11214	\N	\N	\N	\N	\N	\N
250	2556218501	40.6049097	-73.9993077	\N	6	\N	Bay 23rd Street	Next Move Cafe	+1 718-676-9679	\N	11214	info@nextmovecafe.com	\N	\N	\N	\N	\N
251	2557487255	40.6239764	-74.0041395	\N	1273C	\N	Bay Ridge Avenue	\N	\N	\N	11219	\N	\N	\N	\N	\N	\N
252	2561344025	40.6351048	-73.992456	\N	1278	\N	49th Street	Milk Crate Coffee	+19144857135	\N	11219	\N	\N	\N	\N	\N	\N
253	2561485165	40.6341283	-74.0105726	Brooklyn	806	NY	62nd Street	KULU Desserts	\N	\N	11220	\N	\N	\N	\N	\N	\N
254	2561577792	40.6423115	-74.0130189	\N	5423	\N	5th Avenue	Barreras	+1-929-337-6088	\N	11220	\N	\N	\N	\N	\N	\N
255	2561615106	40.6377476	-74.0074241	\N	5602	\N	8th Avenue	Mudflow Bubble Tea	\N	\N	11220	\N	\N	\N	\N	\N	\N
256	2561662288	40.6387505	-74.016308	\N	511	\N	61st Street	GiGis Coffee Shop	+1-347-987-3082	\N	11220	\N	\N	\N	\N	\N	\N
257	2561792451	40.6490646	-74.0095749	\N	4501	\N	4th Avenue	Hua Hui Bakery	+1-718-853-5165	\N	11220	\N	\N	\N	\N	\N	\N
258	2561887744	40.6557373	-74.0032437	\N	912	\N	4th Avenue	Axzo Cafe	+1-347-689-3977	\N	11232	\N	\N	\N	\N	\N	\N
259	2561887844	40.6554369	-74.0060548	\N	\N	\N	\N	Bagel Pub	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	2561900330	40.6593583	-74.0046304	\N	\N	\N	\N	Market Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	2561983227	40.6441763	-73.975829	Brooklyn	424	NY	Church Avenue	Angelicas Coffee Shop	+1-347-442-5226	\N	11218	\N	\N	\N	\N	\N	\N
262	2561995554	40.6490827	-73.977662	\N	142	\N	East 4th Street	Windsor Coffee	\N	\N	11218	\N	\N	\N	\N	\N	\N
263	2562006774	40.6544957	-73.97926	\N	\N	\N	\N	Terrace Coffee Shop	+1-718-854-1911	\N	\N	\N	\N	\N	\N	\N	\N
264	2562015538	40.6532052	-74.0028079	\N	\N	\N	\N	DNA	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	2562136780	40.6637848	-73.9806686	\N	1201	NY	8th Avenue	Zatar	+1-929-252-1287	\N	11215	\N	\N	\N	\N	\N	\N
266	2562136789	40.6614338	-73.9799655	\N	\N	\N	\N	Overgreens	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	2562140908	40.6645751	-73.9799855	\N	1021	\N	8th Avenue	Flora	\N	\N	11215	\N	\N	\N	\N	\N	\N
268	2562374849	40.7385396	-73.987301	\N	257	\N	Park Avenue South	Blue Bottle Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
269	2562374880	40.7368994	-73.986826	\N	\N	\N	\N	Hutch + Waldo	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	2562438646	40.8078217	-73.9450772	New York	\N	NY	\N	Starbucks	+1 917-492-2454	\N	10027	\N	\N	\N	\N	\N	\N
271	2562449499	40.7292441	-74.0037022	\N	29	\N	Bedford Street	Daily Provisions	+1-646-747-8614	\N	10014	\N	\N	\N	\N	\N	\N
272	2562460591	40.7311268	-74.0046067	New York	62	NY	Bedford Street	Bedford Studio	+19173010351	\N	10014	\N	\N	\N	\N	\N	\N
273	2562932451	40.5994599	-73.9518595	\N	1921	\N	Avenue U	Igam Coffee	\N	\N	11229	\N	\N	\N	\N	\N	\N
274	2563014066	40.6000521	-73.9441332	\N	2718	\N	Avenue U	Safir Bakery	\N	\N	11229	\N	\N	\N	\N	\N	\N
275	2563051690	40.6001401	-73.9337877	\N	2145	\N	Knapp Street	Knapp Street Bagel Cafe	\N	\N	11229	\N	\N	\N	\N	\N	\N
276	2563436655	40.634329	-73.9661043	Brooklyn	1119	NY	Newkirk Avenue	Milk and Honey	+1-718-513-0441	\N	11230	\N	\N	\N	\N	\N	\N
277	2563488962	40.6385476	-73.9541164	\N	1292	\N	Flatbush Avenue	We Are Brooklyn	\N	\N	11226	\N	\N	\N	\N	\N	\N
278	2563930327	40.7184787	-74.0024786	New York	396	NY	Broadway	Blue Bottle Coffee	+1-510-653-3394	\N	10013	\N	\N	\N	\N	\N	\N
279	2563990312	40.7157707	-73.9991388	\N	89A	\N	Bayard Street	Alimama Tea	\N	\N	10013	\N	\N	\N	\N	\N	\N
280	2564588997	40.6909692	-73.9048144	Brooklyn	1312	NY	Decatur Street	Tikal Cafe	+1-347-789-4790	\N	11207	tikal_cafe@yahoo.com	\N	\N	\N	\N	\N
281	2565391706	40.6756234	-73.978045	\N	204	\N	6th Avenue	Milk Bar	+1-929-276-3396	\N	11217	\N	\N	\N	\N	\N	\N
282	2565708091	40.7210007	-74.0044453	New York	378	\N	Canal Street	Caffé Bene	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	2567093845	40.6699471	-73.9580715	\N	833	\N	Franklin Avenue	Coffee Land	+1-718-363-5263	\N	11225	\N	\N	\N	\N	\N	\N
284	2567548346	40.7165943	-73.9908966	\N	\N	\N	\N	Gather	+1-646-370-4672	\N	\N	\N	\N	\N	\N	\N	\N
285	2567551910	40.7157788	-73.9965978	\N	48	\N	Bowery	Bake Culture	+1-646-858-2898	\N	10013	\N	\N	\N	\N	\N	\N
286	2567561365	40.7157755	-73.9907804	\N	\N	\N	\N	Aujlas	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	2567902023	40.6716506	-73.9529601	Brooklyn	167	NY	Rogers Avenue	Manhattanville Coffee	\N	\N	11216	\N	\N	\N	\N	\N	\N
288	2567902073	40.6713876	-73.9502108	\N	759	\N	Nostrand Avenue	Colina Cuevo	\N	\N	11216	\N	\N	\N	\N	\N	\N
289	2567931029	40.6730557	-73.9500548	\N	707	\N	Nostrand Avenue	Memes Healthy Nibbles	\N	\N	11216	\N	\N	\N	\N	\N	\N
290	2567931043	40.6728401	-73.950072	\N	715	\N	Nostrand Avenue	Babydudes	\N	\N	11216	\N	\N	\N	\N	\N	\N
291	2568087522	40.682228	-73.9602911	\N	\N	\N	\N	Sweetbee	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	2568119907	40.6881718	-73.9572415	\N	\N	\N	\N	Kitten Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	2568119935	40.6894576	-73.9515389	\N	\N	\N	\N	Natural Blend	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	2568120017	40.6875468	-73.9595811	\N	395	\N	Classon Avenue	Clementine Cafe & Bakery	+1-713-483-8788	\N	11238	info@clementinebakery.com	\N	\N	\N	\N	\N
295	2568133724	40.6883962	-73.962964	\N	318	\N	Lafayette Avenue	Choice Market	+1-917-905-3313	\N	11238	\N	\N	\N	\N	\N	\N
296	2568133754	40.6879326	-73.962875	\N	39	\N	Clifton Place	Guevaras	\N	\N	11238	\N	\N	\N	\N	\N	\N
297	2568179560	40.694106	-73.9591645	\N	620	\N	Myrtle Avenue	enRoys Cafe	+1-646-678-8444	\N	11205	\N	\N	\N	\N	\N	\N
298	2568197213	40.6720107	-73.9306681	\N	\N	\N	\N	Lakou	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	2568198167	40.6940318	-73.9619327	\N	\N	\N	\N	BKG Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	2568239795	40.6908923	-73.9596257	\N	232	\N	Taaffe Place	Monkey Tiger	\N	\N	11205	\N	\N	\N	\N	\N	\N
301	2568275821	40.6930882	-73.9720057	\N	360	\N	Myrtle Avenue	Cafefornia	\N	\N	11205	\N	\N	\N	\N	\N	\N
302	2568406410	40.6964132	-73.9883888	\N	\N	\N	\N	Brooklyn Bridge Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	2568518941	40.7037349	-73.9879047	Brooklyn	142	NY	Plymouth Street	Hudson Wilder	\N	\N	11201	\N	\N	\N	\N	\N	\N
304	2568519070	40.7028271	-73.9812328	\N	70	\N	Hudson Avenue	Cafe Gitane	+1-929-387-8229	\N	11201	\N	\N	\N	\N	\N	\N
305	2568567180	40.6955549	-73.9294705	\N	760	\N	Bushwick Avenue	Brooklyn Whiskers	+1-718-975-7044	\N	11221	brooklynwhiskers@gmail.com	\N	\N	\N	\N	\N
306	2568576411	40.6973827	-73.9350298	\N	\N	\N	\N	The Concrete Jungle	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	2568591477	40.6786224	-73.911041	Brooklyn	142	NY	Rockaway Avenue	Beets Café	\N	\N	11233	\N	\N	\N	\N	\N	\N
308	2568677473	40.7050225	-73.924656	Brooklyn	45	NY	Irving Avenue	Nook	+1-718-734-2880	\N	11237	\N	\N	\N	\N	\N	\N
309	2568681567	40.702775	-73.9170325	Brooklyn	146	NY	Wyckoff Avenue	Variety Coffee Roasters	+1-718-497-2326	\N	11237	info@varietycoffeeroasters.com	\N	\N	\N	\N	\N
310	2568698380	40.6663245	-73.9818623	\N	347	\N	7th Avenue	Brooklyn Bread	+1-929-491-0700	\N	11215	\N	\N	\N	\N	\N	\N
311	2568710180	40.6657195	-73.982369	Brooklyn	367	NY	7th Avenue	WINNER	\N	\N	11215	info@winner.nyc	\N	\N	\N	\N	\N
312	2568724676	40.6678131	-73.9839027	\N	374	\N	9th Street	Colson Patisserie	+1 718 965 6400	\N	11215	\N	\N	\N	\N	\N	\N
313	2568752298	40.6676702	-73.9811411	Brooklyn	312	NY	7th Avenue	Variety Coffee Roasters	+1-718-788-1891	\N	11215	\N	\N	\N	\N	\N	\N
314	2568784668	40.7003347	-73.9052907	Ridgewood	56-23	NY	Myrtle Avenue	UCrew	+1-347-223-4899	\N	11385	\N	\N	\N	\N	\N	\N
315	2568823078	40.706715	-73.9205244	\N	60	\N	Saint Nicholas Avenue	La Cantine	\N	\N	11237	\N	\N	\N	\N	\N	\N
316	2568825600	40.6755418	-73.9743863	\N	176	\N	Lincoln Place	Nerd Be Cool	\N	\N	11217	\N	\N	\N	\N	\N	\N
317	2568863934	40.7097406	-73.9079364	Ridgewood	490	NY	Grandview Avenue	Cafe Katan	\N	\N	11385	\N	\N	\N	\N	\N	\N
318	2568867307	40.6711649	-73.9579423	\N	800	\N	Franklin Avenue	Chocolatte Espresso Bar	\N	\N	11238	\N	\N	\N	\N	\N	\N
319	2568884262	40.6844638	-73.9502489	\N	387A	\N	Nostrand Avenue	Ursula	\N	\N	11216	\N	\N	\N	\N	\N	\N
320	2569261266	40.736735	-74.0013586	\N	75	\N	Greenwich Avenue	Roasting Plant	\N	\N	10014	\N	\N	\N	\N	\N	\N
321	2569266671	40.7408955	-74.0070903	\N	425	\N	West 13th Street	Jacks Coffee	\N	\N	10014	\N	\N	\N	\N	\N	\N
322	2569888074	40.7193908	-73.8424538	\N	72-01	\N	Austin Street	Pink Forest	\N	\N	11375	\N	\N	\N	\N	\N	\N
323	2569902274	40.7215673	-73.8434614	Forest Hills	108-01	NY	Queens Boulevard	Starbucks	+1 347-534-0009	\N	11375	\N	\N	\N	\N	\N	\N
324	2569997914	40.7494756	-73.8900736	\N	35-62	\N	76th Street	Jujus Bagel Cafe	\N	\N	11372	\N	\N	\N	\N	\N	\N
325	2569998627	40.7496039	-73.8888911	\N	35-57A	\N	77th Street	Espresso 77	\N	\N	11372	\N	\N	\N	\N	\N	\N
326	2569998650	40.749454	-73.8882529	\N	77-15A	\N	37th Avenue	Arepa Lady	\N	\N	11372	\N	\N	\N	\N	\N	\N
327	2569998659	40.7495446	-73.8873518	Queens	78-27	NY	37th Avenue	Starbucks	+1 718-457-0875	\N	11372	\N	\N	\N	\N	\N	\N
328	2570139436	40.7500213	-73.8829205	\N	83-15	\N	37th Avenue	Over the Moon Juice & Coffee	+1-929-344-8058	\N	11372	\N	\N	\N	\N	\N	\N
329	2570174028	40.7478048	-73.8857009	\N	37-65	\N	80th Street	969 NYC Coffee	\N	\N	11372	\N	\N	\N	\N	\N	\N
330	2570174168	40.7494686	-73.8858258	\N	80-10	\N	37th Avenue	Brothers Bubble Tea	\N	\N	11372	\N	\N	\N	\N	\N	\N
331	2572411294	40.717109	-73.9945679	New York	73	NY	Chrystie Street	Kung Fu Tea	+1 646-288-4936	\N	10002	\N	\N	\N	\N	\N	\N
332	2573047744	40.6809942	-73.9745562	\N	64	\N	6th Avenue	Companion	+1-347-689-3184	\N	11217	\N	\N	\N	\N	\N	\N
333	2573098394	40.6802759	-73.9744858	Brooklyn	253	NY	Flatbush Avenue	Hungry Ghost	+1-718-483-8666	\N	11217	\N	\N	\N	\N	\N	\N
334	2573098461	40.6796163	-73.9686086	\N	\N	\N	\N	Patti Anns Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
335	2573115164	40.6784658	-73.9687739	\N	598	\N	Vanderbilt Avenue	Little Cupcake Bakeshop	+1-718-783-0770	\N	11238	\N	\N	\N	\N	\N	\N
336	2583190796	40.7766224	-73.9890983	\N	120	\N	Riverside Boulevard	Blu Café	\N	\N	\N	info@120cafe.com	\N	\N	\N	\N	\N
337	2583212030	40.8010399	-73.9618044	New York	990	NY	Columbus Avenue	Crêpes on Columbus	\N	\N	10025	\N	\N	\N	\N	\N	\N
338	2592305754	40.7428458	-73.9999943	New York	178	NY	8th Avenue	16 Handles	\N	\N	10011	\N	\N	\N	\N	\N	\N
339	2594630499	40.7047913	-74.0071236	New York	99	NY	Wall Street	Starbucks	+1 929-955-1841	\N	10005	\N	\N	\N	\N	\N	\N
340	2596227489	40.69176	-73.9885471	Fulton Mall	348	NY	Fulton Street	Starbucks	+1 718-488-1719	\N	11201	\N	\N	\N	\N	\N	\N
341	2597860936	40.7607479	-73.9706036	New York	109	\N	East 56th Street	Ninth Street Espresso	+1 646-559-4793	\N	10022	\N	\N	\N	\N	\N	\N
342	2603955352	40.8414095	-73.9398998	\N	\N	\N	\N	Mikes Bagels	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	2603955361	40.8413365	-73.9399524	New York	4001	NY	Broadway	Starbucks	+1 917-521-0342	\N	10032	\N	\N	\N	\N	\N	\N
344	2603955364	40.8235504	-73.9490856	New York	1658	NY	Amsterdam Avenue	Yellow Banana Snack Bar	\N	\N	10031	\N	\N	\N	\N	\N	\N
345	2605399148	40.6932623	-73.9686685	Brooklyn	423	NY	Myrtle Avenue	Connecticut Muffin	\N	\N	11205	\N	\N	\N	\N	\N	\N
346	2605527968	40.6759007	-74.0143917	\N	\N	\N	\N	Island Vibes	\N	\N	\N	\N	\N	\N	\N	\N	\N
347	2610440239	40.7634192	-73.981318	\N	\N	\N	\N	Café Metro	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	2610440250	40.7608044	-73.9837222	New York	750	NY	7th Avenue	Starbucks	+1 212-974-0032	\N	10019	\N	\N	\N	\N	\N	\N
349	2611782760	40.75555	-73.9840554	New York	1101	NY	6th Avenue	Starbucks	+1 212-382-3917	\N	10036	\N	\N	\N	\N	\N	\N
350	2620513899	40.7774839	-73.9552436	New York	1488	NY	3rd Avenue	Starbucks	+1 212-744-7458	\N	10028	\N	\N	\N	\N	\N	\N
351	2620513907	40.7794817	-73.9537572	New York	1542	NY	3rd Avenue	Starbucks	+1 212-369-2949	\N	10128	\N	\N	\N	\N	\N	\N
352	2621577431	40.7438766	-73.9887987	New York	1140	NY	Broadway	Starbucks	+1 212-213-6519	\N	10001	\N	\N	\N	\N	\N	\N
353	2622901049	40.7082623	-73.8690773	Glendale	8000	NY	Cooper Avenue	Starbucks	+1 718-416-1521	\N	11385	\N	\N	\N	\N	\N	\N
354	2623014627	40.7659236	-73.9636686	New York	1128	NY	3rd Avenue	Starbucks	+1 212-472-6535	\N	10065	\N	\N	\N	\N	\N	\N
355	2623014636	40.7746444	-73.9543658	New York	1559	NY	2nd Avenue	Starbucks	\N	\N	10028	\N	\N	\N	\N	\N	\N
356	2629277997	40.7636753	-73.9773838	New York	1380	NY	6th Avenue	Starbucks	+1 212-977-1382	\N	10019	\N	\N	\N	\N	\N	\N
357	2629371835	40.7653752	-73.9575093	New York	1270	NY	1st Avenue	Le Pain Quotidien	\N	\N	10021	\N	\N	\N	\N	\N	\N
358	2629371850	40.7791466	-73.9474467	New York	400	NY	East 90th Street	Starbucks	+1 212-987-0891	\N	10128	\N	\N	\N	\N	\N	\N
359	2631523818	40.7689352	-73.963462	\N	956	\N	Lexington Avenue	World Cup Cafe & Bakery	\N	\N	10021	\N	\N	\N	\N	\N	\N
360	2634398946	40.7452192	-73.9908474	New York	776	NY	Avenue of the Americas	Starbucks	+1 212-481-1856	\N	10001	\N	\N	\N	\N	\N	\N
361	2678783481	40.7620837	-73.9833543	New York	156	NY	West 52nd Street	Starbucks	+1 212-245-6479	\N	10019	\N	\N	\N	\N	\N	\N
362	2688264646	40.7590282	-73.9926029	New York	684	NY	9th Avenue	Starbucks	+1 212-398-9702	\N	10036	\N	\N	\N	\N	\N	\N
363	2689474985	40.7799038	-73.9597037	New York	1142	NY	Madison Avenue	Starbucks	+1 212-288-1506	\N	10028	\N	\N	\N	\N	\N	\N
364	2689493100	40.7314891	-73.8595033	\N	97-42	\N	63rd Street	Bagelette	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	2692607521	40.6873283	-73.9896984	\N	85	\N	Dean Street	Blue Bottle Coffee	\N	\N	11201	\N	\N	\N	\N	\N	\N
366	2698768779	40.746016	-73.9144787	Woodside	49-22	\N	Skillman Avenue	Aubergine Cafe	\N	\N	11377	\N	\N	\N	\N	\N	\N
367	2701626574	40.676481	-73.9716825	\N	183	\N	Sterling Place	Hungry Ghost	+1-718-783-7375	8	11238	\N	\N	\N	\N	\N	\N
368	2701690257	40.6775852	-73.9691008	\N	622	\N	Vanderbilt Avenue	Mille-feuille	+1-347-350-8838	\N	11238	\N	\N	\N	\N	\N	\N
369	2702831847	40.7422223	-74.0046642	\N	75	\N	9th Avenue	chalait	6466494012	\N	10011	\N	\N	\N	\N	\N	\N
370	2702857192	40.744475	-74.0062646	New York	128	\N	10th Avenue	Star On 18	\N	\N	10011	\N	\N	\N	\N	\N	\N
371	2703020624	40.7445639	-73.9992418	\N	231	\N	8th Avenue	Fellini Coffee	\N	\N	10011	\N	\N	\N	\N	\N	\N
372	2703043913	40.7397486	-73.9926774	New York	23	NY	West 19th Street	Gotham Coffee Roasters	+1-212-255-2972	\N	10011	\N	\N	\N	\N	\N	\N
373	2703242521	40.7473252	-74.000383	\N	\N	\N	\N	Sullivan Street bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	2704023647	40.735181	-73.9860339	New York	184	\N	3rd Avenue	Gramercy Cafe	212-982-2121	\N	10003	\N	\N	\N	\N	\N	\N
375	2704034204	40.7359816	-73.98546	\N	206	\N	3rd Avenue	Sunburst Espresso Bar	\N	\N	10003	\N	\N	\N	\N	\N	\N
376	2704040262	40.7371981	-73.9845693	\N	246	\N	3rd Avenue	Gramercy Bagels	\N	\N	10003	\N	\N	\N	\N	\N	\N
377	2704042945	40.7352652	-73.983052	\N	323A	\N	2nd Avenue	Mon Cheri	+1-917-409-0077	\N	10003	\N	\N	\N	\N	\N	\N
378	2704104122	40.7408146	-73.983604	New York	61	NY	Lexington Avenue	Yi Fang Tea	\N	\N	10010	\N	\N	\N	\N	\N	\N
379	2705030255	40.6737697	-73.9570069	Brooklyn	730	\N	Franklin Avenue	Little Zelda	\N	\N	11238	\N	\N	\N	\N	\N	\N
380	2705995455	40.6738283	-73.9566698	\N	\N	\N	\N	Bien Cuit	+1-347-365-1656	\N	\N	\N	\N	\N	\N	\N	\N
381	2707987524	40.8052024	-73.9656144	New York	2878	\N	Broadway	Tea Magic	\N	\N	10025	\N	\N	\N	\N	\N	\N
382	2709335786	40.7456894	-73.9851162	\N	121	\N	Madison Avenue	Blank Slate Coffee + Kitchen	+1-212-683-7800	\N	10016	\N	\N	\N	\N	\N	\N
383	2709415082	40.7482758	-73.9823964	\N	199	\N	Madison Avenue	Cinco Coffee Company	\N	\N	10016	\N	\N	\N	\N	\N	\N
384	2709629969	40.7547832	-73.9913539	\N	572	\N	8th Avenue	Grace Cafe	\N	\N	10018	\N	\N	\N	\N	\N	\N
385	2710195178	40.7688283	-73.9885588	New York	864	NY	10th Avenue	Rex	+1 212-757-0580	\N	10019	\N	\N	\N	\N	\N	\N
386	2710196320	40.7685278	-73.9855197	New York	891	NY	9th Avenue	Masseria Caffé & Bakery	+1-212-969-0900	\N	10019	info@masseriacaffenyc.com	\N	\N	\N	\N	\N
387	2711466517	40.7532252	-73.9668578	New York	875	\N	1st Avenue	Nations Café	\N	\N	10017	\N	\N	\N	\N	\N	\N
388	2711628444	40.7516393	-73.9702273	\N	305	\N	East 45th Street	Pennylane Coffee	\N	\N	10017	\N	\N	\N	\N	\N	\N
389	2713490449	40.6783449	-73.9636951	Brooklyn	637	NY	Washington Avenue	Nûrish	+1-718-484-1122	\N	11238	\N	\N	\N	\N	\N	\N
390	2713495194	40.6772948	-73.9634988	\N	\N	\N	\N	Stocked Cafe	+1-718-872-5304	\N	\N	\N	\N	\N	\N	\N	\N
391	2714805250	40.7521428	-73.9739415	New York	160	NY	East 44th Street	Gong Cha	+1 646-707-3375	\N	10017	\N	\N	\N	\N	\N	\N
392	2714805259	40.7506675	-73.973776	\N	205	\N	East 42nd Street	Aroma Espresso Bar	\N	\N	10017	\N	\N	\N	\N	\N	\N
393	2715447782	40.7599011	-73.9696793	New York	667	NY	Lexington Avenue	Maman	+1-646-524-5067	\N	10022	\N	\N	\N	\N	\N	\N
394	2715512001	40.7503295	-73.9770276	New York	360	NY	Lexington Avenue	Starbucks	+1 212-953-1662	\N	10017	\N	\N	\N	\N	\N	\N
395	2715512070	40.7580277	-73.9714246	New York	600	NY	Lexington Avenue	Devocion	\N	\N	10022	\N	\N	\N	\N	\N	\N
396	2716012047	40.7583219	-73.9741196	New York	45	NY	East 51st Street	Starbucks	+1 347-708-5805	\N	10022	\N	\N	\N	\N	\N	\N
397	2716012089	40.7563907	-73.9782057	New York	575	NY	5th Avenue	Starbucks	+1 212-490-3189	\N	10017	\N	\N	\N	\N	\N	\N
398	2717323719	40.7602955	-73.9845027	\N	1600	\N	Broadway	Gong Cha	\N	\N	10019	\N	\N	\N	\N	\N	\N
399	2717542956	40.7557612	-73.9805909	New York	18	\N	West 45th Street	FreeFoods	\N	\N	10036	\N	\N	\N	\N	\N	\N
400	2721574123	40.7604406	-73.987191	New York	770	NY	8th Avenue	Starbucks	+1 212-830-9001	\N	10036	\N	\N	\N	\N	\N	\N
401	2722857800	40.75965	-73.985965	New York	228	\N	West 47th Street	Cafe Edison	\N	\N	10036	\N	\N	\N	\N	\N	\N
402	2723749688	40.7663762	-73.9599027	\N	1296	\N	2nd Avenue	Gotham Green Cafe	\N	\N	10065	\N	\N	\N	\N	\N	\N
403	2723749985	40.76607	-73.9574726	New York	1281	NY	1st Avenue	Starbucks	+1 212-472-1312	\N	10021	\N	\N	\N	\N	\N	\N
404	2723782910	40.7699331	-73.9546801	New York	1445	NY	1st Avenue	Starbucks	+1 212-472-7784	\N	10021	\N	\N	\N	\N	\N	\N
405	2723813006	40.767958	-73.9637948	\N	925	\N	Lexington Avenue	Gong Cha	646-876-1020	\N	10065	\N	\N	\N	\N	\N	\N
406	2723866660	40.7698597	-73.9671261	New York	20	NY	East 69th Street	Poppi	\N	\N	10065	info@poppi.nyc	\N	\N	\N	\N	\N
407	2723870222	40.7692531	-73.9632427	New York	960	NY	Lexington Avenue	Corrado Bread And Pastry	(212)774-1904	\N	10021	\N	\N	\N	\N	\N	\N
408	2723953331	40.7742485	-73.9629901	\N	35	\N	East 76th Street	Café Carlyle	\N	\N	10021	\N	\N	\N	\N	\N	\N
409	2723965261	40.7737711	-73.9578856	\N	1374	\N	3rd Avenue	Harbs	+1 646-896-1511	\N	10075	\N	\N	\N	\N	\N	\N
410	2723970267	40.7719283	-73.953579	\N	355	\N	East 78th Street	Le Petit Parisienne	+1 917-262-0910	\N	10075	\N	\N	\N	\N	\N	\N
411	2724165752	40.7826516	-73.9534733	\N	1378	\N	Lexington Avenue	La Bomboniera	\N	\N	10128	\N	\N	\N	\N	\N	\N
412	2724181868	40.7773842	-73.9552806	\N	1486	\N	3rd Avenue	Juice Generation	\N	\N	10028	\N	\N	\N	\N	\N	\N
413	2725606562	40.6864151	-73.9852989	\N	112	\N	Bond Street	Café Kitsuné	\N	\N	11217	\N	\N	\N	\N	\N	\N
414	2744944466	40.7748547	-73.9841451	New York	141	NY	Amsterdam Avenue	Starbucks	+1 646-276-8254	\N	10023	\N	\N	\N	\N	\N	\N
415	2745010769	40.777108	-73.9817979	New York	2040	NY	Broadway	Chanson	\N	\N	10023	\N	\N	\N	\N	\N	\N
416	2745359371	40.7778296	-73.9793656	\N	117	\N	West 72nd Street	Juice Generation	\N	\N	10023	\N	\N	\N	\N	\N	\N
417	2745500634	40.7819863	-73.9813099	New York	2161	NY	Broadway	Le Pain Quotidien	+1 (332) 910-6880	\N	10024	\N	\N	\N	\N	\N	\N
418	2745527658	40.7822863	-73.9787291	\N	375	\N	Amsterdam Avenue	Daily Provisions	\N	\N	10024	\N	\N	\N	\N	\N	\N
419	2745534942	40.7818389	-73.9757879	New York	392	NY	Columbus Avenue	Wafels & Dinges	+1-646-454-1229	\N	10024	\N	\N	\N	\N	\N	\N
420	2745620594	40.7847359	-73.9796748	\N	2241	\N	Broadway	Zabars Cafe	(212) 787-2000	\N	10024	\N	\N	\N	\N	\N	\N
421	2758287019	40.7867605	-73.9722137	New York	540	NY	Columbus Avenue	Starbucks	+1 212-496-4163	\N	10024	\N	\N	\N	\N	\N	\N
422	2758924029	40.8220999	-73.9496705	New York	1619	\N	Amsterdam Avenue	Café One	\N	\N	10031	\N	\N	\N	\N	\N	\N
423	2759204916	40.7910099	-73.9741121	New York	2446	NY	Broadway	Tal Bagels	+1-212-712-0171	\N	10024	\N	\N	\N	\N	\N	\N
424	2759235789	40.7921965	-73.9732253	New York	2486	NY	Broadway	Fillup Coffee	\N	\N	10025	\N	\N	\N	\N	\N	\N
425	2761499679	40.7982405	-73.9695072	New York	2667	NY	Broadway	Shiny Tea NY	\N	\N	10025	\N	\N	\N	\N	\N	\N
426	2761570412	40.7984682	-73.9636775	New York	914	NY	Columbus Avenue	City Coffee Bar	+1-646-398-7772	\N	10025	\N	\N	\N	\N	\N	\N
427	2761641622	40.7994859	-73.9610681	New York	153	NY	Manhattan Avenue	Park Cafe	+1-646-370-3773	\N	10025	\N	\N	\N	\N	\N	\N
428	2761671634	40.8031673	-73.9670896	New York	2810	NY	Broadway	Gong Cha	+1-646-850-6566	\N	10025	\N	\N	\N	\N	\N	\N
429	2762451097	40.7997636	-73.9526587	New York	19	NY	Saint Nicholas Avenue	Claires Kitchen Cafe	+1 917-409-1717	\N	10026	\N	\N	\N	\N	\N	\N
430	2768305932	40.8274731	-73.9493563	New York	3570;3576	NY	Broadway	Hamiltons Bakery and Cafe	\N	\N	10031	\N	\N	\N	\N	\N	\N
431	2768438965	40.8113713	-73.961115	New York	3070	NY	Broadway	Broadway Au Lait	+1-212-865-8429	\N	10027	\N	\N	\N	\N	\N	\N
432	2768451021	40.8140293	-73.959994	\N	121	\N	La Salle Street	Kuro Kuma	+1(347) 577-3177	\N	10027	\N	\N	\N	\N	\N	\N
433	2768451031	40.8150497	-73.9590898	New York	3165	NY	Broadway	Starbucks	+1 929-243-2549	\N	10027	\N	\N	\N	\N	\N	\N
434	2768881133	40.7262803	-73.8527601	Forest Hills	10102	NY	Queens Boulevard	Starbucks	+1 718-459-6923	\N	11375	\N	\N	\N	\N	\N	\N
435	2768914083	40.7209514	-73.8472921	Forest Hills	7000	NY	Austin Street	Starbucks	+1 718-268-4719	\N	11375	\N	\N	\N	\N	\N	\N
436	2796448528	40.8062968	-73.9654905	New York	2901	NY	Broadway	Blue Bottle Coffee	\N	\N	10025	\N	\N	\N	\N	\N	\N
437	2797917337	40.7663043	-73.9829515	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
438	2806612113	40.8370735	-73.9098361	Bronx	316	NY	East 170th Street	Coffee Donuts	\N	\N	10456	\N	\N	\N	\N	\N	\N
439	2806938230	40.85355	-73.889002	\N	591	\N	Crescent Avenue	Prince coffee house	\N	\N	10458	\N	\N	\N	\N	\N	\N
440	2810072654	40.8848531	-73.9003309	Bronx	234	NY	West 238th Street	Mon Amour	+1-718-708-7804	\N	10463	\N	\N	\N	\N	\N	\N
441	2821326392	40.7116433	-74.0066898	New York	38	NY	Park Row	Starbucks	+1 212-608-8073	\N	10038	\N	\N	\N	\N	\N	\N
442	2824696370	40.7112884	-74.0102748	\N	41	\N	Church Street	Épicerie Boulud	\N	\N	10007	\N	\N	\N	\N	\N	\N
443	2825064871	40.7092434	-74.0078826	New York	45	NY	John Street	Suited	\N	\N	10038	info@suitednyc.com	\N	\N	\N	\N	\N
444	2825233200	40.7137279	-74.0084336	\N	25	\N	Murray Street	Takahachi Bakery	\N	\N	10007	\N	\N	\N	\N	\N	\N
445	2826407083	40.7426583	-73.9983133	New York	224	\N	West 20th Street	Café Grumpy	+1 212-255-5511	\N	10011	\N	\N	\N	\N	\N	\N
446	2826433688	40.7151271	-73.9901425	New York	13	NY	Essex Street	Café Grumpy	+1-212-777-7515	\N	10002	\N	\N	\N	\N	\N	\N
447	2826442741	40.7116726	-73.9946073	New York	41	NY	Monroe Street	CC’s Cafe	+1 212-571-1060	\N	10002	\N	\N	\N	\N	\N	\N
448	2826470599	40.7422365	-73.9949484	New York	131	\N	West 21st Street	Joe Pro Shop & Headquarters	+1 212-924-7400	\N	10011	\N	\N	\N	\N	\N	\N
449	2826581781	40.7163413	-73.9885359	New York	379	NY	Grand Street	The Doughnut Plant	+1 212-505-3700	\N	10002	\N	\N	\N	\N	\N	\N
450	2827168690	40.7474254	-73.9737287	\N	714	\N	2nd Avenue	Ground Central	\N	\N	10016	\N	\N	\N	\N	\N	\N
451	2827478159	40.803562	-73.9636828	New York	1030	NY	Amsterdam Avenue	Hungarian Pastry Shop	+1 212-866-4230	\N	10025	\N	\N	\N	\N	\N	\N
452	2827518401	40.6790789	-74.0106634	\N	\N	\N	\N	The Black Flamingo	\N	\N	\N	\N	\N	\N	\N	\N	\N
453	2827530645	40.6779288	-74.0120268	\N	\N	\N	\N	Red Hook Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	2834844701	40.7729961	-73.9742495	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
455	2838525822	40.7076759	-73.9516638	\N	362	\N	Hewes Street	Nyla	+1-347-859-7102	\N	11211	\N	\N	\N	\N	\N	\N
456	2838596351	40.7054219	-73.9323788	Brooklyn	18	NY	Grattan Street	SEY Coffee	\N	\N	11206	\N	\N	\N	\N	\N	\N
457	2838706928	40.7125301	-73.9438874	\N	296	\N	Graham Avenue	Muz Muz CBD Lounge	+1-917-341-1843	\N	11211	\N	\N	\N	\N	\N	\N
458	2838720789	40.712008	-73.9489067	\N	502	\N	Lorimer Street	Campbell & Co.	+1-718-387-2267	\N	11211	\N	\N	\N	\N	\N	\N
459	2838733588	40.7139069	-73.9418565	\N	26	\N	Bushwick Avenue	Here	\N	\N	\N	\N	\N	\N	\N	\N	\N
460	2839801731	40.7147488	-73.9400571	Brooklyn	867	NY	Metropolitan Avenue	Rose Wolf Coffee	\N	\N	11211	\N	\N	\N	\N	\N	\N
461	2839887895	40.7260331	-73.9391293	Brooklyn	290	NY	Nassau Avenue	Alkemy Brewlab	\N	\N	11222	\N	\N	\N	\N	\N	\N
462	2842175072	40.7140816	-73.9478315	\N	636	\N	Metropolitan Avenue	Pecoraro Latteria	\N	\N	11211	\N	\N	\N	\N	\N	\N
463	2842244629	40.71746	-73.9450305	Brooklyn	415	NY	Graham Avenue	Daytime	\N	\N	11211	Daytimebk@gmail.com	\N	\N	\N	\N	\N
464	2842613040	40.7229766	-73.950475	\N	\N	\N	\N	Hide & Seek	+1-917-909-0670	\N	\N	\N	\N	\N	\N	\N	\N
465	2842780183	40.7285374	-73.9486571	Brooklyn	193	\N	Meserole Avenue	Café Grumpy	+1 718-349-7623	\N	11222	\N	\N	\N	\N	\N	\N
466	2842929201	40.7278772	-73.9571169	Brooklyn	94	NY	Franklin Street	Cookie Road	\N	\N	11222	\N	\N	\N	\N	\N	\N
467	2842929227	40.7292924	-73.95735	\N	128	\N	Franklin Street	Littleneck Outpost	\N	\N	11222	\N	\N	\N	\N	\N	\N
468	2842929254	40.7269042	-73.9573871	\N	47	\N	Franklin Street	Chez Ma Tante	\N	\N	11222	\N	\N	\N	\N	\N	\N
469	2842985885	40.7324479	-73.9543033	\N	141	\N	India Street	La Paris Dakar	\N	\N	11222	\N	\N	\N	\N	\N	\N
470	2842989041	40.7327188	-73.9545157	\N	\N	\N	\N	Odd Fox	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	2844564754	40.7368064	-73.8957616	\N	50-01	\N	69th Street	69 Coffee Shop	+1-718-705-2143;+1-347-642-8226;+1-347-832-0628	\N	11377	\N	\N	\N	\N	\N	\N
472	2844905703	40.7395701	-73.9206272	\N	44-17	\N	48th Avenue	Cafe Bliss & Organic Juice Bar	+1 929-353-2959	\N	11377	\N	\N	\N	\N	\N	\N
473	2844936136	40.7418591	-73.9262321	\N	39-10	\N	47th Avenue	Blended Smoothies	\N	\N	11104	\N	\N	\N	\N	\N	\N
474	2844936165	40.7420469	-73.9285338	\N	47-02	\N	37th Street	Cypriana	+1 718-361-1747	\N	11101	\N	\N	\N	\N	\N	\N
475	2844942090	40.7429092	-73.918991	\N	45-18	\N	Queens Boulevard	Möge Tee	+1 718-550-5888	\N	11104	\N	\N	\N	\N	\N	\N
476	2844942213	40.7413798	-73.9191699	\N	45-58	\N	46th Street	MiraCali Bakery	+1 718-482-8840	\N	11104	\N	\N	\N	\N	\N	\N
477	2844971064	40.7432719	-73.9242401	\N	45-09	\N	40th Street	Mr. Buncha	+1 718-255-6534	\N	11104	\N	\N	\N	\N	\N	\N
478	2844971065	40.7422129	-73.9253981	\N	45-51	\N	47th Avenue	Moa Coffee	\N	\N	11104	\N	\N	\N	\N	\N	\N
479	2844999918	40.7450262	-73.9204706	\N	43-24	\N	43rd Avenue	The Spot Café	+1 917-396-4036	\N	11104	\N	\N	\N	\N	\N	\N
480	2845010834	40.7439034	-73.922528	Sunnyside	41-31	NY	Queens Boulevard	Bon Cafe & Restaurant	\N	50	11104	\N	\N	\N	\N	\N	\N
481	2846354510	40.7489601	-73.8907354	\N	75-02	\N	37th Avenue	Rickys Cafe	\N	\N	11372	\N	\N	\N	\N	\N	\N
482	2846402163	40.7609317	-73.9089978	\N	47-14	\N	30th Avenue	Café Renis	+1-718-255-1730	\N	11103	info@caferenis.com	\N	\N	\N	\N	\N
483	2846642881	40.7576335	-73.9224942	Long Island City	32-90	NY	36th Street	Monikas Cafe Bar	\N	\N	11106	\N	\N	\N	\N	\N	\N
484	2846661366	40.7590916	-73.9187165	\N	31-89	\N	Steinway Street	Teamakers	\N	\N	11103	\N	\N	\N	\N	\N	\N
485	2846677628	40.763595	-73.9150423	Astoria	30-05	\N	Steinway Street	Kinship Coffee Cooperative	\N	\N	11103	\N	\N	\N	\N	\N	\N
486	2846684670	40.7677861	-73.9116338	\N	25-01	\N	Steinway Street	Sands of Persia	\N	\N	11103	\N	\N	\N	\N	\N	\N
487	2846780757	40.7656278	-73.9192526	\N	30-06	\N	34th Street	Chip City	(917) 745-0101	\N	11103	\N	\N	\N	\N	\N	\N
488	2846780759	40.765578	-73.9192929	\N	30-08	\N	34th Street	Kung Fu Tea	\N	\N	11103	\N	\N	\N	\N	\N	\N
489	2846792636	40.7627789	-73.9204923	\N	34-20	\N	31st Avenue	Coffee Lab	\N	\N	11106	\N	\N	\N	\N	\N	\N
490	2847155477	40.7650671	-73.9393789	\N	9-02	NY	34th Avenue	Flor De Azalea	+1 718 777 0523	\N	11106	\N	\N	\N	\N	\N	\N
491	2850982606	40.7633433	-73.771073	\N	41-06	\N	Bell Boulevard	Marthas Country Bakery	\N	\N	11361	\N	\N	\N	\N	\N	\N
492	2853050594	40.7519896	-73.9255705	\N	37-18	NY	Northern Boulevard	Coffeed	+1 718 6061299	\N	11101	\N	\N	\N	\N	\N	\N
493	2853426879	40.7704743	-73.8920016	\N	21-02	\N	78th Street	Bakery Cafe	\N	\N	11370	\N	\N	\N	\N	\N	\N
494	2868687318	40.6606255	-73.7684448	\N	\N	\N	\N	Breaking Barriers Christian Bookstore and Coffee Shop	+1-631-504-4697	\N	\N	\N	\N	\N	\N	\N	\N
495	2870890239	40.7092917	-73.8299776	Kew Gardens	80-62	NY	Lefferts Boulevard	Mr. Wish	+1-347-767-4344	\N	11415	\N	\N	\N	\N	\N	\N
496	2881757687	40.7567369	-73.7678124	\N	47-04	\N	Bell Boulevard	Peters Hot Bagel	\N	\N	11361	\N	\N	\N	\N	\N	\N
497	2882114302	40.7400532	-73.7912001	Queens	183-01	NY	Horace Harding Expressway Service Road North;Horace Harding Expressway	Star Care	\N	\N	11365	\N	\N	\N	\N	\N	\N
498	2882311702	40.7398345	-73.8152924	\N	60-04	\N	Kissena Boulevard	Kissena Cafe	\N	\N	11355	\N	\N	\N	\N	\N	\N
499	2883466310	40.7596293	-73.8303649	Flushing	39-22	NY	Main Street	Coco	+1-718-321-8566	\N	11354	\N	\N	\N	\N	\N	\N
500	2883480565	40.7580314	-73.829601	Flushing	41-02	NY	Main Street	Starbucks	+1 718-358-9355	\N	11355	\N	\N	\N	\N	\N	\N
501	2883913635	40.7797043	-73.8461782	Queens	22-16	NY	College Point Boulevard	Inblue Coffee Roaster	\N	\N	11356	\N	\N	\N	\N	\N	\N
502	2884017661	40.7460474	-73.8598778	\N	46-10	\N	104th Street	Mamas Backyard Cafe	+1-718-565-9104	\N	11368	\N	\N	\N	\N	\N	\N
503	2884381855	40.7614943	-73.8675775	\N	101-20	\N	Astoria Boulevard	Black Sheep Coffee House	\N	\N	11369	\N	\N	\N	\N	\N	\N
504	2895301059	40.6576676	-73.8391993	\N	159-49	\N	Cross Bay Boulevard	Etto	\N	\N	11414	\N	\N	\N	\N	\N	\N
505	2897265318	40.709679	-74.0083821	\N	71	\N	Nassau Street	d Elici	+1 212-587-5740	\N	10038	\N	\N	\N	\N	\N	\N
506	2897270433	40.7102382	-74.0106426	\N	22	\N	Cortlandt Street	The Coffee Bean & Tea Leaf	\N	\N	\N	\N	\N	\N	\N	\N	\N
507	2897876740	40.7182651	-74.007295	New York	372	NY	Greenwich Street	Starbucks	+1 929-923-1534	\N	10013	\N	\N	\N	\N	\N	\N
508	2898706760	40.7071222	-74.0049867	New York	135	\N	John Street	Coffee Project New York | Financial District	+13157146564	\N	10038	\N	\N	\N	\N	\N	\N
509	2898706761	40.7065796	-74.0050348	\N	\N	\N	\N	Flavors	+12124802561	\N	10038	\N	\N	\N	\N	\N	\N
510	2912097356	40.8999191	-73.9125427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	2946299764	40.7533516	-73.9957959	\N	365	\N	West 34th Street	34th Bagels & More	+1-347-691-6172	\N	10001	\N	\N	\N	\N	\N	\N
512	2956614141	40.7711259	-73.8269158	Flushing	29-42	NY	Union Street	Paris Baguette	929-305-0404	\N	11354	\N	\N	\N	\N	\N	\N
513	2985573623	40.7412113	-74.004914	New York	52	\N	9th Avenue	Le Pain Quotidien	\N	\N	10014	\N	\N	\N	\N	\N	\N
514	3041538637	40.7343889	-74.002678	\N	\N	\N	\N	Cafe Condesa	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	3041561933	40.7354463	-74.0031986	\N	\N	\N	\N	Sant Ambroeus	\N	\N	\N	\N	\N	\N	\N	\N	\N
516	3041587933	40.7352996	-74.0062382	New York	551	NY	Hudson Street	Cafe Panino Mucho Gusto	+1-212-229-2799	\N	10014	\N	\N	\N	\N	\N	\N
517	3057117017	40.760572	-73.9687188	New York	140	\N	East 57th Street	Juan Valdez Café	+1 917-289-0981	\N	10022	\N	\N	\N	\N	\N	\N
518	3061926346	40.7074571	-73.9402479	Brooklyn	222	\N	Montrose Avenue	Dun-Well Doughnuts	+1-347-294-0871	\N	11206	\N	\N	\N	\N	\N	\N
519	3118144380	40.665751	-73.9099068	\N	\N	\N	\N	Tropical Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	3143926573	40.7724449	-73.9499445	New York	1515	NY	York Avenue	Starbucks	+1 212-472-3581	\N	10028	\N	\N	\N	\N	\N	\N
521	3144820987	40.6418353	-73.96338	\N	\N	\N	\N	Madeline	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	3144821006	40.6600527	-73.9532648	\N	499	\N	Rogers Avenue	PLG Brooklyn	\N	\N	11225	\N	\N	\N	\N	\N	\N
523	3147863538	40.717832	-73.9904985	New York	81	NY	Orchard Street	Roasting Plant	+1-212-775-7755	\N	10002	\N	\N	\N	\N	\N	\N
524	3153302100	40.7120232	-73.9412907	\N	799	\N	Grand Street	Flower Power Cafe	13477991611	\N	\N	\N	\N	\N	\N	\N	\N
525	3153553993	40.6396053	-73.9676128	\N	1106	\N	Cortelyou Road	Connecticut Muffin	\N	\N	\N	\N	\N	\N	\N	\N	\N
526	3153554058	40.6408437	-73.9648662	\N	1416	\N	Cortelyou Road	Catskill Bagel	\N	\N	\N	\N	\N	\N	\N	\N	\N
527	3154231930	40.6869934	-73.9753732	Brooklyn	33	NY	Lafayette Avenue	Baba Cool	+1-347-689-2344	\N	11217	hello@babacoolbk.com	\N	\N	\N	\N	\N
528	3154231943	40.6860974	-73.9735627	\N	781	\N	Fulton Street	Hungry Ghost	+1-718-797-3595	\N	11217	\N	\N	\N	\N	\N	\N
529	3154274261	40.7082598	-73.9401186	\N	\N	\N	\N	Bread Brothers	\N	\N	\N	\N	\N	\N	\N	\N	\N
530	3154274268	40.7081622	-73.9397458	\N	\N	\N	\N	Jessies Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	3154320971	40.6768587	-74.0132688	\N	\N	\N	\N	Baked	\N	\N	\N	\N	\N	\N	\N	\N	\N
532	3154646654	40.7123642	-73.939496	\N	861	\N	Grand Street	Dumpling Cafe	7183028886	\N	\N	\N	\N	\N	\N	\N	\N
533	3179745213	40.7504102	-73.9928259	New York	2	NY	Penn Plaza	Tim Hortons	+1 212-630-0320	\N	10121	\N	\N	\N	\N	\N	\N
534	3190230455	40.7062033	-74.011905	New York	30	NY	Broad Street	Bluestone Lane Coffee	\N	\N	10004	\N	\N	\N	\N	\N	\N
535	3199078271	40.7129493	-73.9555025	Brooklyn	66	NY	Hope Street	66 Hope Cafe	\N	\N	11211	\N	\N	\N	\N	\N	\N
536	3212413923	40.717999	-73.9901682	\N	88	\N	Orchard Street	Sunday to Sunday	+1 917-675-6096	\N	\N	ralph@sundaytosundaynyc.com	10002	\N	\N	\N	\N
537	3214381356	40.6773649	-73.9638565	\N	\N	\N	\N	Sit & Wonder	+1-718-622-0299	\N	\N	\N	\N	\N	\N	\N	\N
538	3214830154	40.6726439	-73.9623811	Brooklyn	409	NY	Lincoln Place	Lincoln Station	\N	\N	11238	\N	\N	\N	\N	\N	\N
539	3217939901	40.7644229	-73.9879761	New York	774	NY	9th Avenue	Kahve	+1 212 256-0207	\N	10019	\N	\N	\N	\N	\N	\N
540	3233781193	40.7327952	-73.9979676	New York	30	NY	West 8th Street	Stumptown	1-855-711-3385	\N	10011	info@stumptowncoffee.com	\N	\N	\N	\N	\N
541	3233782170	40.7306205	-73.9951131	New York	29	NY	Waverly Place	Orens Daily Roast	+1 212-420-5958	\N	10003	\N	\N	\N	\N	\N	\N
542	3233791134	40.7293867	-73.9987052	New York	230	NY	Thompson Street	The Uncommons	+1-646-543-9215	\N	10012	us@uncommonsnyc.com	\N	\N	\N	\N	\N
543	3235708620	40.7779198	-73.978202	New York	267-275	NY	Columbus Avenue	Starbucks	+1 212-579-7834	\N	10023	\N	\N	\N	\N	\N	\N
544	3236430399	40.7631897	-73.9219964	Astoria	31-05	NY	33rd Street	Madame Sousou	(718) 710-6577	\N	11106	\N	\N	\N	\N	\N	\N
545	3248774671	40.7810251	-73.981008	New York	2138	NY	Broadway	Starbucks	\N	\N	10023	\N	\N	\N	\N	\N	\N
546	3264422314	40.7469335	-73.9933215	New York	315	NY	7th Avenue	Starbucks	+1 646-336-6462	\N	10001	\N	\N	\N	\N	\N	\N
547	3265464818	40.746485	-73.9822904	\N	48	\N	East 33rd Street	Gregorys Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
548	3273820747	40.7557287	-73.9904972	New York	274	NY	West 40th Street	Kiss My Slice	\N	\N	10018	\N	\N	\N	\N	\N	\N
549	3315216998	40.5773628	-73.9612739	Brooklyn	602	NY	Brighton Beach Avenue	Euroasia Cafe	+1 718-891-0008	\N	11235	\N	\N	\N	\N	\N	\N
550	3338584818	40.8472105	-73.8444918	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	3341829009	40.7736696	-73.9596624	New York	1101	\N	Lexington Avenue	Pick-A-Bagel	+1 212-517-6590	\N	10075	\N	\N	\N	\N	\N	\N
552	3350673925	40.7031934	-73.9924249	\N	40	\N	Water Street	Butler	\N	\N	11201	\N	\N	\N	\N	\N	\N
553	3356089620	40.7452778	-73.9845987	\N	\N	\N	\N	Cafe Delectica	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	3397669018	40.6642537	-73.980669	\N	1112	\N	8th Avenue	Ladybird Bakery	+1-718-499-8108	6	11215	\N	\N	\N	\N	\N	\N
555	3413255880	40.7738089	-73.8845606	\N	\N	\N	\N	Java City	\N	\N	\N	\N	\N	\N	\N	\N	\N
556	3421054402	40.7300535	-73.9915669	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
557	3448911320	40.7777126	-73.9570936	\N	1228	\N	Lexington Avenue	Tal Bagels	+1-212-247-6811	\N	10028	\N	\N	\N	\N	\N	\N
558	3452345664	40.8233712	-73.9523695	\N	3446	\N	Broadway	Tanto Dulce Cafe	+1 (212) 368-1701	\N	10031	\N	\N	\N	\N	\N	\N
559	3452904870	40.7559373	-73.9234715	Astoria	37-11	NY	35th Avenue	Starbucks	+1 718-706-0464	\N	11101	\N	\N	\N	\N	\N	\N
560	3480352395	40.7646902	-73.9796633	\N	\N	\N	\N	Blue Dog	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	3506087030	40.730322	-74.0003624	New York	119	NY	MacDougal Street	Caffe Reggio	\N	\N	10012	\N	\N	\N	\N	\N	\N
562	3569401282	40.7596628	-73.9366128	\N	\N	\N	\N	B&S Coffe Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
563	3574687793	40.7289402	-73.9845472	New York	163	NY	1st Avenue	Tarallucci e Vino	\N	\N	10003	\N	\N	\N	\N	\N	\N
564	3574719396	40.727887	-73.982007	\N	293	\N	East 10th Street	Horus Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	3575165389	40.7109207	-73.9678242	\N	25	\N	Broadway	Blank cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
566	3577542666	40.7531885	-73.9797511	\N	11	\N	East 42nd Street	Bluestone Lane Coffee	\N	\N	10017	\N	\N	\N	\N	\N	\N
567	3581307956	40.7280641	-73.9932516	New York	400	NY	Lafayette Street	La Colombe Coffee Roasters	212 677 5834	\N	10003	\N	\N	\N	\N	\N	\N
568	3583796993	40.7354601	-73.9861323	New York	145	\N	East 17th Street	Corbet & Conley	212-982-3939	\N	10003	\N	\N	\N	\N	\N	\N
569	3597257541	40.7542147	-73.9840492	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
570	3627346235	40.8345127	-73.945255	New York	5	NY	Edward M. Morgan Place	Taszo Espresso Bar	\N	\N	10032	\N	\N	\N	\N	\N	\N
571	3627374568	40.8346192	-73.9452659	New York	9	NY	Edward M. Morgan Place	Caffe Bene	\N	\N	10032	\N	\N	\N	\N	\N	\N
572	3674126480	40.6633723	-73.984318	\N	435	\N	7th Avenue	Couleur Café	+1-718-788-6600	\N	11215	\N	\N	\N	\N	\N	\N
573	3674170468	40.6685322	-73.9804203	\N	\N	\N	\N	La Bagel Delight	+1-718-768-6107	\N	\N	\N	\N	\N	\N	\N	\N
574	3674170469	40.6710647	-73.9851813	Brooklyn	326	NY	6th Street	Postmark Cafe	+1-718-768-2613	\N	11215	\N	\N	\N	\N	\N	\N
575	3676784853	40.7326688	-73.986116	New York	226	NY	East 14th Street	ViVi Bubble Tea	+1-212-777-8988	\N	10003	\N	\N	\N	\N	\N	\N
576	3676902927	40.7337952	-73.9865529	\N	145	\N	3rd Avenue	Starbucks	\N	\N	10003	\N	\N	\N	\N	\N	\N
577	3676918489	40.7344416	-73.9860982	New York	165	NY	3rd Avenue	Cupsoul	\N	\N	10003	\N	\N	\N	\N	\N	\N
578	3722347103	40.6806397	-73.9747435	Brooklyn	245	NY	Flatbush Avenue	Doughnut Plant	\N	\N	11217	\N	\N	\N	\N	\N	\N
579	3733142431	40.7530185	-73.9772838	Grand Central Station	35	NY	Track	Starbucks	+1 212-370-4161	\N	10017	\N	\N	\N	\N	\N	\N
580	3737556178	40.674634	-73.9815568	\N	251	\N	5th Avenue	Kos Kaffe	+1-718-768-6868	\N	11215	\N	\N	\N	\N	\N	\N
581	3743024926	40.7143881	-73.95913	Brooklyn	667	NY	Driggs Avenue	Meyers Bageri	\N	\N	11211	\N	\N	\N	\N	\N	\N
582	3763236414	40.7428227	-73.9355534	Long Island City	31-00	NY	47th Avenue	Petite Maman	+1 347-617-1723	\N	11101	\N	\N	\N	\N	\N	\N
583	3785185545	40.7693396	-73.9886262	New York	875	NY	10th Avenue	Bagel Market	\N	\N	10019	\N	\N	\N	\N	\N	\N
584	3792073193	40.7711856	-73.9568688	New York	1449	NY	Second Avenue	Starbucks	+1 212-472-0653	\N	10021	\N	\N	\N	\N	\N	\N
585	3792489700	40.764814	-73.9759888	\N	41	\N	West 58th Street	Sip + Co.	+1-917-388-3757	\N	10019	\N	\N	\N	\N	\N	\N
586	3792505152	40.7417954	-73.9970742	\N	\N	\N	\N	FIKA 7th Avenue	(646) 922-7994	\N	\N	\N	\N	\N	\N	\N	\N
587	3792513846	40.7510046	-73.9765387	\N	\N	\N	\N	FIKA Grand Central	(212) 832-0022	\N	\N	\N	\N	\N	\N	\N	\N
588	3792524993	40.723711	-74.0104259	\N	\N	\N	\N	FIKA Tribeca & Chocolate Factory	(212) 706-0565	\N	\N	\N	\N	\N	\N	\N	\N
589	3792532817	40.7458278	-74.0015707	\N	\N	\N	\N	FIKA 9th Avenue	(646) 590-3275	\N	\N	\N	\N	\N	\N	\N	\N
590	3793130994	40.7447183	-73.9790898	\N	472	\N	3rd Avenue	Blank Street Coffee	\N	\N	10016	\N	\N	\N	\N	\N	\N
591	3793131890	40.7450755	-73.9789117	\N	164	\N	East 33rd Street	Matto Espresso	\N	\N	10016	\N	\N	\N	\N	\N	\N
592	3804422050	40.7735017	-73.9168591	\N	\N	\N	\N	Mighty Oak Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
593	3805991007	40.7139547	-73.9492036	Brooklyn	566	NY	Lorimer Street	Bagelsmith	+1-347-294-0046	\N	11211	\N	\N	\N	\N	\N	\N
594	3805991016	40.7137679	-73.9461019	Brooklyn	289	NY	Manhattan Avenue	Fortunato Brothers	(718) 387-2281	\N	11211	\N	\N	\N	\N	\N	\N
595	3808846153	40.6841002	-73.941024	\N	\N	\N	\N	Anchor Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
596	3808872720	40.6814746	-73.9555748	\N	505	\N	Franklin Avenue	Cafe Calaca	\N	\N	11216	\N	\N	\N	\N	\N	\N
597	3810255154	40.6711037	-73.9576449	Brooklyn	341	NY	Eastern Parkway	Starbucks	+1 718-778-0140	\N	11216	\N	\N	\N	\N	\N	\N
598	3819492771	40.7224756	-73.9829662	New York	29	NY	Avenue B	29B Teahouse	+1-646-864-0093	\N	10009	info@tea-dealers.com	\N	\N	\N	\N	\N
599	3819620508	40.7229149	-73.9832351	\N	199	NY	East 3rd Street	Kolkota Chai Company	\N	\N	10009	\N	\N	\N	\N	\N	\N
600	3821171656	40.7536535	-73.984378	\N	\N	\N	\N	Southwest Porch	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	3822484908	40.7200547	-73.9551628	Brooklyn	101	NY	Bedford Avenue	The Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
602	3829610926	40.7503257	-73.9716056	\N	\N	\N	\N	Chelsea Bagel	\N	\N	\N	\N	\N	\N	\N	\N	\N
603	3843956495	40.807525	-73.9608785	\N	\N	\N	\N	Nous Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	3843979174	40.8858609	-73.9101471	Bronx	3503	NY	Johnson Avenue	Starbucks	+1 718-543-2348	\N	10463	\N	\N	\N	\N	\N	\N
605	3856527489	40.7419355	-73.9608611	Long Island City	52-10	NY	Center Boulevard	Frank Ottomanellis	\N	\N	11101	\N	\N	\N	\N	\N	\N
606	3860891458	40.7600363	-73.9205039	\N	31-86	\N	37th Street	Seek Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	3862796859	40.780846	-73.917133	\N	\N	\N	\N	Agnanti Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	3862797058	40.754429	-73.933859	\N	38-08	\N	29th Street	Our Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	3863634562	40.738035	-74.003421	\N	\N	\N	\N	Grounded	\N	\N	\N	\N	\N	\N	\N	\N	\N
610	3863639458	40.737043	-74.003887	\N	\N	\N	\N	Café Minerva	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	3864972068	40.746726	-73.947598	\N	\N	\N	\N	LIC Corner Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
612	3865005275	40.743271	-73.95158	\N	10-93	\N	Jackson Avenue	Sweetleaf	+1 917-832-6726	\N	11101	sweetleafLIC@gmail.com	\N	sweetleafnyc	sweetleafLIC	\N	\N
613	3869752135	40.7370022	-73.9896034	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	3874983057	40.7467841	-74.0016172	\N	405	\N	West 23rd Street	Joe Coffee Company	+1 212-206-0669	\N	10011	\N	\N	\N	\N	\N	\N
615	3876361757	40.7485056	-74.0087396	New York	62	NY	Chelsea Piers	Bluestone Lane	+1-718-374-6858	\N	\N	\N	\N	\N	\N	\N	\N
616	3887161496	40.6723462	-73.9834645	\N	\N	\N	\N	Culture	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	3892300447	40.7502191	-73.967463	\N	\N	\N	\N	UN Visitors Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	3892789169	40.6652482	-73.9827527	Brooklyn	383	\N	7th Avenue	Café Grumpy	+1-718-349-7623	\N	11215	\N	\N	\N	\N	\N	\N
619	3925063780	40.725171	-74.00295	New York	189	\N	Spring Street	Dominique Ansel Bakery	+1 212-219-2773	\N	10012	info@dominiqueansel.com	\N	DominiqueAnsel	DominiqueAnsel	\N	\N
620	3938479922	40.712179	-74.008181	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	3938479923	40.7658131	-73.9653728	\N	861	\N	Lexington Avenue	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
622	3953943320	40.6772443	-73.986012	\N	\N	\N	\N	Runner & Stone	+1-718-577-3360	\N	\N	\N	\N	\N	\N	\N	\N
623	3953943884	40.67686	-73.9863149	\N	\N	\N	\N	Babas Pierogies	+1 718 222 0777	\N	\N	\N	\N	\N	\N	\N	\N
624	3956950395	40.7437478	-73.9790582	\N	201	\N	East 31st Street	Banter	\N	\N	10016	\N	\N	\N	\N	\N	\N
625	3958232658	40.7435815	-73.9920821	New York	750	NY	6th Avenue	Starbucks	+1 646-230-7208	\N	10010	\N	\N	\N	\N	\N	\N
626	3958232662	40.7435359	-73.9925708	\N	729	\N	6th Avenue	The Corner Cafe	\N	\N	10010	\N	\N	\N	\N	\N	\N
627	3960147947	40.7498951	-73.972877	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
628	3960166157	40.7446682	-73.98756	New York	246	NY	5th Avenue	Think Coffee	\N	\N	10001	\N	\N	\N	\N	\N	\N
629	3966939353	40.7439872	-73.9858906	\N	\N	\N	\N	Seven grams	\N	\N	\N	\N	\N	\N	\N	\N	\N
630	3971304159	40.7172343	-73.9564033	\N	\N	\N	\N	Black Star Bakery & Cafe	\N	\N	11211	\N	\N	\N	\N	\N	\N
631	4015736091	40.719225	-74.0066966	\N	\N	\N	\N	Gotan	\N	\N	\N	\N	\N	\N	\N	\N	\N
632	4046001489	40.697597	-73.967895	Brooklyn	200	\N	Flushing Avenue	Brooklyn Roasting Company	+1-718-858-5500	\N	\N	\N	\N	\N	\N	\N	\N
633	4046748105	40.6937302	-73.9227848	\N	\N	\N	\N	Sunrise Sunset	\N	\N	\N	\N	\N	\N	\N	\N	\N
634	4060041033	40.6720888	-73.9902886	\N	439	\N	3rd Avenue	Four & Twenty Blackbirds	+1-718-499-2917	\N	11215	\N	\N	\N	\N	\N	\N
635	4071615040	40.7570864	-73.9052234	Woodside	56-02	NY	31st Avenue	Bagelmania	+1 718-766-5250	\N	11377	\N	\N	\N	\N	\N	\N
636	4109992400	40.643698	-73.781688	\N	\N	\N	\N	Flatiron Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
637	4111168991	40.8233265	-73.9426474	New York	301	NY	West 145th Street	Starbucks	+1 212-690-7835	\N	10039	\N	\N	\N	\N	\N	\N
638	4113143110	40.7623369	-73.9258716	Astoria	30-05	NY	Broadway	Lots O Bagels (LOB)	+1-718-267-7777	\N	11106	\N	\N	\N	\N	\N	\N
639	4121987909	40.6980282	-73.9247573	Brooklyn	1288	NY	Myrtle Avenue	Bushwick Public House	+1-917-966-8500	\N	11221	\N	\N	\N	\N	\N	\N
640	4121987910	40.6974573	-73.9238126	Brooklyn	219	NY	Central Avenue	First Live Coffee House	\N	\N	11221	\N	\N	\N	\N	\N	\N
641	4124782089	40.7457175	-74.0054589	\N	156	\N	10th Avenue	Cookshop	(212) 924-4440	\N	\N	\N	\N	\N	\N	\N	\N
642	4130652235	40.7596945	-73.9958873	\N	\N	\N	\N	Rustic Table 	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	4133854273	40.7879358	-73.9534358	\N	1399	\N	Madison Avenue	Le Pain Quotidien	+16466633149	\N	\N	\N	\N	\N	\N	\N	\N
644	4149649611	40.6756179	-73.9563406	\N	666	\N	Franklin Avenue	Black Milk	\N	\N	11238	\N	\N	\N	\N	\N	\N
645	4149654208	40.674047	-73.9569035	\N	718	\N	Franklin Avenue	Coffee Land	\N	\N	11238	\N	\N	\N	\N	\N	\N
646	4149654227	40.7358239	-74.0008231	\N	\N	\N	\N	Bluestone Lane	+1 646 684 3771	\N	\N	\N	\N	\N	\N	\N	\N
647	4149654228	40.73833	-74.0053849	\N	\N	\N	\N	Hudson Cafe	+1 212 390 1744	\N	\N	\N	\N	\N	\N	\N	\N
648	4149654489	40.7290455	-73.9866452	\N	307	\N	East 9th Street	MUD	+1-212-529-8766	\N	\N	hello@mudnyc.com	\N	\N	\N	\N	\N
649	4178936437	40.7433724	-73.9580969	\N	\N	\N	\N	Blackstar Coffee	\N	\N	11101	\N	\N	\N	\N	\N	\N
650	4181508248	40.8873655	-73.9049519	\N	\N	\N	\N	An Beal Bocht Cafe	+1 718 884 7127	\N	\N	\N	\N	\N	\N	\N	\N
651	4194049886	40.6802941	-73.9946681	\N	343	\N	Smith Street	Hungry Ghost Coffee	\N	\N	11231	\N	\N	\N	\N	\N	\N
652	4204705079	40.7684031	-73.91111	\N	24-21	\N	Steinway Street	Noisette Pastry Shop	+1 718-433-4211	\N	\N	\N	\N	\N	\N	\N	\N
653	4204915989	40.7388422	-74.0056803	\N	\N	\N	Hudson Street	High Street on Hudson	\N	\N	\N	\N	\N	\N	\N	\N	\N
654	4208955389	40.7345574	-74.0063447	\N	535	\N	Hudson Street	Sweet Corner Bakeshop	\N	\N	\N	\N	\N	\N	\N	\N	\N
655	4212376889	40.7341718	-74.0074226	\N	\N	\N	\N	The Elk	+1 212 933 4780	\N	\N	\N	\N	\N	\N	\N	\N
656	4213578591	40.7593488	-73.9885067	\N	\N	\N	\N	Carve Café & Pizza	\N	\N	\N	\N	\N	\N	\N	\N	\N
657	4227278392	40.7403739	-74.0055542	\N	28	\N	9th Avenue	Kobrick Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	4230588256	40.7552587	-73.9945988	New York	265 w	NY	West 37th Street	Ramini espresso bar	\N	\N	10018	\N	\N	\N	\N	\N	\N
659	4248928405	40.7515474	-73.9705865	New York	844	\N	2nd Avenue	Matto Espresso	\N	\N	10017	\N	\N	\N	\N	\N	\N
660	4252850545	40.6751853	-73.9747957	\N	\N	\N	\N	Bar Basic	+1-347-348-3046	\N	\N	\N	\N	\N	\N	\N	\N
661	4252887915	40.6756809	-73.9748149	\N	62	\N	7th Avenue	Cousin Johns	+1-718-622-7333	\N	11217	\N	\N	\N	\N	\N	\N
662	4252917490	40.6742229	-73.9752617	\N	\N	\N	\N	Velvette Black	\N	\N	\N	\N	\N	\N	\N	\N	\N
663	4300438090	40.7281762	-73.9821791	New York	165	NY	Avenue A	Tompkins Square Bagels	+1-646-351-6520	\N	10009	\N	\N	\N	\N	\N	\N
664	4300546590	40.7363315	-73.9971668	\N	500	\N	6th Avenue	Murrays Bagels	+1 212-462-2830	\N	10011	\N	\N	\N	\N	\N	\N
665	4312082389	40.7137511	-73.9985135	\N	\N	\N	\N	10 Below Ice Cream	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	4312750372	40.7136847	-73.9657829	Brooklyn	45	NY	South 3rd Street	Freehold	\N	\N	11211	\N	\N	\N	\N	\N	\N
667	4315763593	40.6733902	-73.9630957	\N	820	\N	Washington Avenue	Most High	\N	\N	11238	\N	\N	\N	\N	\N	\N
668	4315764095	40.6844714	-73.9291389	\N	243	\N	Malcolm X Boulevard	Natural Blend	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	4316449694	40.6870767	-73.944146	\N	\N	\N	\N	Maya Congee Cafe	+1-347-326-6003	\N	\N	\N	\N	\N	\N	\N	\N
670	4316449792	40.7174195	-73.962872	\N	242	\N	Wythe Avenue	Depanneur	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	4316479489	40.6844783	-73.9918497	\N	\N	\N	\N	Bee''s Knees Provisions	+1-718-971-1197	\N	\N	\N	\N	\N	\N	\N	\N
672	4316480189	40.7171428	-73.962413	\N	85	\N	North 3rd Street	Shanti Shack	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	4325385750	40.7125186	-73.9660797	Brooklyn	396	NY	Wythe Avenue	Jane Motorcycles	\N	\N	11211	\N	\N	\N	\N	\N	\N
674	4330787300	40.7608908	-73.9889333	\N	\N	\N	\N	Frisson Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
675	4334482651	40.7159615	-73.9647675	Brooklyn	69	NY	Grand Street	Devoción	+17182856180	\N	11249	\N	\N	\N	\N	\N	\N
676	4348628442	40.689553	-73.9226253	Brooklyn	1071	NY	Gates Avenue	Cup of Brooklyn	\N	\N	11221	\N	\N	\N	\N	\N	\N
677	4360186863	40.6881049	-73.9866471	\N	77B	\N	Hoyt Street	The Little Sweet Café	+1-718-858-8998	\N	11217	\N	\N	\N	\N	\N	\N
678	4394357390	40.7532402	-73.9845838	\N	70	\N	West 40th Street	Le Pain Quotidien	+1 212-354-5224	\N	\N	\N	\N	\N	\N	\N	\N
679	4402180605	40.7636783	-73.9823708	New York	1700	NY	Broadway	Starbucks	+1 212-245-0761	\N	10019	\N	\N	\N	\N	\N	\N
680	4407735236	40.5865941	-74.1678707	Staten Island	2505	NY	Richmond Avenue	Starbucks	+1 718-494-4451	\N	10314	\N	\N	\N	\N	\N	\N
681	4413028226	40.5639129	-74.1151804	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
682	4414226423	40.5641436	-74.1143881	Staten Island	2754	NY	Hylan Boulevard	Starbucks	+1 718-980-0892	\N	10306	\N	\N	\N	\N	\N	\N
683	4441702689	40.7480793	-73.9892846	New York	875	NY	6th Avenue	Starbucks	+1 212-629-6540	\N	10001	\N	\N	\N	\N	\N	\N
753	4845789723	40.704646	-74.0084317	\N	\N	\N	\N	Bluestone Lane	+12127479082	\N	10005	\N	\N	\N	\N	\N	\N
684	4442836595	40.7455323	-73.9943777	New York	275	NY	7th Avenue	Seven Grams Caffe	+1 212-727-1777	\N	10001	info@sevengramscaffe.com	\N	\N	\N	\N	\N
685	4444156976	40.7363224	-73.994803	\N	18	\N	West 14th Street	ViVi Bubble Tea	\N	\N	10011	\N	\N	\N	\N	\N	\N
686	4450364090	40.8213006	-73.9445186	\N	\N	\N	\N	Manhattanville Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
687	4479054694	40.783839	-73.9584235	\N	\N	\N	\N	Bluestone Lane	\N	\N	\N	\N	\N	\N	\N	\N	\N
688	4479721389	40.7643286	-73.984836	\N	891	\N	8th Avenue	Pick a Bagel	+1 212-582-8333	\N	10019	\N	\N	\N	\N	\N	\N
689	4481455792	40.7469873	-73.9969959	\N	\N	\N	\N	Bean&Bean Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
690	4491325489	40.7175502	-73.9578621	Brooklyn	189	NY	Bedford Avenue	Bagelsmith	+1 718-218-7414	\N	11211	\N	\N	\N	\N	\N	\N
691	4491370794	40.6759285	-73.9497883	\N	615	\N	Nostrand Avenue	Rosalia''s Cafe	(718) 758-4640	\N	\N	\N	\N	\N	\N	\N	\N
692	4491402090	40.6941122	-73.9867868	Brooklyn	6	NY	Metro Tech, Poly Tech Institute	Starbucks	+1 718-522-2396	\N	11201	\N	\N	\N	\N	\N	\N
693	4494829289	40.7622096	-73.9874605	New York	325	NY	West 49th Street	Starbucks	+1 212-765-2205	\N	10019	\N	\N	\N	\N	\N	\N
694	4503163757	40.7391221	-73.9899657	New York	902	NY	Broadway	Brooks Brothers - Red Fleece Cafe	\N	\N	10003	\N	\N	\N	\N	\N	\N
695	4513631498	40.7227486	-73.9890819	\N	205	\N	Allen Street	ViVi Bubble Tea	+1 646-651-7779	\N	10014	\N	\N	\N	\N	\N	\N
696	4515550805	40.7180559	-73.997117	New York	121	NY	Mott Street	12 Corners	+1 646 717 2849	\N	10013	\N	\N	\N	\N	\N	\N
697	4518440389	40.5952532	-74.0000236	Brooklyn	8973	NY	Bay Parkway	Starbucks	+1 718-265-1069	\N	11214	\N	\N	\N	\N	\N	\N
698	4526577170	40.6816603	-74.0007585	Brooklyn	570	\N	Henry Street	Henry''s Local Café	\N	\N	11231	\N	\N	\N	\N	\N	\N
699	4526840980	40.6935774	-73.9854421	Brooklyn	2	NY	Metrotech Center	Pret A Manger	\N	\N	11201	\N	\N	\N	\N	\N	\N
700	4551161735	40.7273019	-73.9861875	New York	81	NY	East 7th Street	Abraço	+1 212 388 9731	\N	10003	\N	\N	\N	\N	\N	\N
701	4555620974	40.7415915	-74.0052445	New York	61	NY	9th Avenue	Starbucks Reserve	+1 212-691-0531	\N	10011	\N	\N	\N	\N	\N	\N
702	4557782565	40.752013	-73.975055	\N	\N	\N	\N	Bagel Market	+1 212-681-6300	\N	\N	\N	\N	\N	\N	\N	\N
703	4559245080	40.6949243	-73.9830118	Brooklyn	309	NY	Gold Street	Starbucks	+1 347-997-2633	\N	11201	\N	\N	\N	\N	\N	\N
704	4559289815	40.6924303	-73.9884433	\N	\N	\N	\N	H Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
705	4564273493	40.7436151	-73.9863949	New York	21	NY	East 27th Street	Birch Coffee	+1 212-686-1444	\N	10016	27thstreet@birchcoffee.com	\N	\N	\N	\N	\N
706	4568929157	40.7189006	-74.0025174	New York	405	NY	Broadway	Starbucks	+1 646-613-0148	\N	10013	\N	\N	\N	\N	\N	\N
707	4590581470	40.5224847	-74.2165145	Staten Island	6372	NY	Amboy Road	Citi Bagels	+1-718-967-9300	\N	10309	\N	\N	\N	\N	\N	\N
708	4625658555	40.6901367	-73.994571	\N	156	\N	Atlantic Avenue	Swallow Cafe	+1-347-689-4192	\N	11201	\N	\N	\N	\N	\N	\N
709	4629752125	40.740124	-74.0014925	\N	256	\N	West 15th Street	MatchaBar	+1 212-627-1058	\N	10011	\N	\N	\N	\N	\N	\N
710	4643140509	40.7322343	-73.8663972	Rego Park	92-77	NY	Queens Boulevard	Starbucks	+1 347-997-2496	\N	11374	\N	\N	\N	\N	\N	\N
711	4646428189	40.69506	-73.9492931	\N	574	\N	Marcy Avenue	Marcy and Myrtle	\N	\N	\N	\N	\N	\N	\N	\N	\N
712	4648572598	40.7073889	-73.8352995	\N	116-29	\N	Metropolitan Avenue	Ateaz	\N	\N	\N	info@ateaz.com	\N	\N	\N	\N	\N
713	4664765789	40.7290876	-73.9982833	New York	550	NY	LaGuardia Place	Joe Coffee Company	\N	\N	10012	\N	\N	\N	\N	\N	\N
714	4668049689	40.7206037	-73.984423	New York	23	NY	Clinton Street	Boba Guys	\N	\N	10002	\N	\N	\N	\N	\N	\N
715	4687114892	40.7564367	-73.971716	\N	\N	\N	\N	New York Luncheonette	\N	\N	10022	\N	\N	\N	\N	\N	\N
716	4687813992	40.7671306	-73.9224642	\N	30-04	\N	30th Street	Astoria Coffee	\N	\N	11102	dennis@astoriacoffeeny.com	\N	\N	\N	\N	\N
717	4691611733	40.7546713	-73.9745591	\N	\N	\N	\N	Financier	\N	\N	\N	\N	\N	\N	\N	\N	\N
718	4708888898	40.7064444	-74.0079647	\N	\N	\N	\N	Black Fox coffee co.	\N	\N	\N	\N	\N	\N	\N	\N	\N
719	4711391870	40.7526386	-73.9845169	New York	45	\N	West 39th Street	Mangia Organic	\N	\N	10018	\N	\N	\N	\N	\N	\N
720	4714009789	40.7202282	-73.9965346	\N	379	\N	Broome Street	Stone Street	+1-917-8470663	\N	\N	\N	\N	\N	\N	\N	\N
721	4744338823	40.7423375	-73.9553503	\N	\N	\N	\N	51st Bakery & Cafe	7187070554	\N	11101	\N	\N	\N	\N	\N	\N
722	4746777521	40.742213	-73.9895802	New York	200	NY	5th Avenue	Eataly	+1-212-229-2560	\N	10010	\N	\N	\N	\N	\N	\N
723	4747210026	40.8285671	-73.9485323	New York	3610	NY	Broadway	Chipped Cup Coffee & Victuals	+1 (212) 368-8881	\N	10031	\N	\N	\N	\N	\N	\N
724	4751253522	40.659434	-73.9813708	\N	\N	\N	\N	Poetica Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
725	4751253523	40.660715	-73.9803125	\N	\N	\N	\N	Connecticut Muffin	\N	\N	\N	\N	\N	\N	\N	\N	\N
726	4755831441	40.7212663	-74.0005133	New York	471	NY	Broadway	Think Coffee	\N	\N	10013	\N	\N	\N	\N	\N	\N
727	4757307022	40.742791	-73.9352138	\N	31-00	\N	47th Avenue	Doughnut Plant	\N	\N	11101	\N	\N	\N	\N	\N	\N
728	4757312021	40.7443091	-73.9966612	\N	220	\N	West 23rd Street	Doughnut Plant	\N	\N	10011	\N	\N	\N	\N	\N	\N
729	4757977331	40.7691438	-73.9536834	\N	\N	\N	\N	Oslo Coffee Roasters	\N	\N	10021	\N	\N	\N	\N	\N	\N
730	4759945018	40.7461999	-73.978007	\N	516A	\N	3rd Avenue	Semicolon	\N	\N	10016	\N	\N	\N	\N	\N	\N
731	4760672500	40.7545627	-73.9839414	\N	\N	\N	\N	Breads Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
732	4762031974	40.7534774	-73.9842882	\N	\N	\N	\N	Joe Coffee Company	+1 212-924-7400	\N	\N	\N	\N	\N	\N	\N	\N
733	4768308054	40.7455378	-73.9501596	\N	\N	\N	\N	CommuniTea	\N	\N	\N	\N	\N	\N	\N	\N	\N
734	4771881068	40.7185107	-73.9862303	New York	102	NY	Suffolk Street	Davelle NYC	\N	\N	10002	\N	\N	\N	\N	\N	\N
735	4774165522	40.6722669	-73.9575421	\N	\N	\N	\N	Crown Heights Café	+1-718-789-7070	\N	\N	\N	\N	\N	\N	\N	\N
736	4774165523	40.6719283	-73.9609821	\N	843	\N	Classon Avenue	Jungle Juice Cafe	\N	\N	11238	\N	\N	\N	\N	\N	\N
737	4775546659	40.7597637	-73.9698075	\N	661	\N	Lexington Avenue	Le Cafe Coffee	\N	\N	10022	\N	\N	\N	\N	\N	\N
738	4781188614	40.7289162	-74.0054734	New York	225	NY	Varick Street	Getting Hungry	\N	\N	10014	\N	\N	\N	\N	\N	\N
739	4784576322	40.7202995	-73.9952147	\N	\N	\N	\N	Cafe Integral	\N	\N	\N	\N	\N	\N	\N	\N	\N
740	4786042527	40.7146942	-73.9986811	\N	\N	\N	\N	Silk Road Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
741	4786076422	40.7138876	-73.9562351	\N	\N	\N	\N	Parlor Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
742	4792165597	40.7141971	-73.9937931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
743	4811875621	40.714903	-73.9597145	Brooklyn	232	NY	Metropolitan Avenue	sweatshop	\N	\N	11211	\N	\N	\N	\N	\N	\N
744	4812548139	40.6812041	-73.9966255	Brooklyn	384	NY	Court Street	East One Coffee Roasters	+1-347-987-4919	\N	11231	\N	\N	\N	\N	\N	\N
745	4815675523	40.6827477	-73.9955411	\N	333	\N	Court Street	The Brooklyn Strategist	+1-718-576-3035	\N	11231	\N	\N	\N	\N	\N	\N
746	4816185281	40.8075501	-73.9636821	New York	2950	NY	Broadway	Joe Coffee Company	\N	\N	10027	\N	\N	\N	\N	\N	\N
747	4818137923	40.7638732	-73.9665249	\N	134 1/2	\N	East 62nd Street	Birch Coffee	+1 212-686-1444	\N	10062	62ndstreet@birchcoffee.com	\N	\N	\N	\N	\N
748	4818137924	40.7434433	-73.9800242	\N	432	\N	3rd Avenue	Birch Coffee	+1-212-686-1444	\N	10016	30thstreet@birchcoffee.com	\N	\N	\N	\N	\N
749	4825695925	40.7073526	-74.0022569	\N	223	\N	Front Street	Café Patoro	+1 (917) 262-0031	\N	10038	\N	\N	\N	\N	\N	\N
750	4825800433	40.7160182	-73.959494	Brooklyn	231	NY	Bedford Avenue	Hungry Ghost	\N	\N	11211	\N	\N	\N	\N	\N	\N
751	4827882221	40.7426975	-73.9337688	\N	47-01	\N	Van Dam Street	Don Dean Bakery	\N	\N	11101	\N	\N	\N	\N	\N	\N
752	4844172523	40.7313359	-73.9919775	\N	771	\N	Broadway	The Bean	+1-646-781-9620	\N	10003	\N	\N	\N	\N	\N	\N
754	4845866425	40.7073586	-74.0022266	\N	223	\N	Front Street	Cafe Patoro	+19172620031	\N	10038	\N	\N	\N	\N	\N	\N
755	4846158321	40.7056733	-74.0083741	\N	69B	\N	Wall Street	La Colombe Coffee Roasters	+1-212-220-0415	\N	10005	\N	\N	\N	\N	\N	\N
756	4846658821	40.7520894	-73.9900673	\N	\N	\N	\N	The Bread Factory Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
757	4847502523	40.7472688	-73.9841528	\N	\N	\N	\N	Captain''s Cafe	+12127797191	\N	10016	\N	\N	\N	\N	\N	\N
758	4848257933	40.7188835	-74.0101049	New York	\N	\N	\N	Chanson le Salon	\N	\N	\N	\N	\N	\N	\N	\N	\N
759	4850230746	40.7075935	-74.0021812	\N	\N	\N	\N	Made Fresh Daily	+12122852253	\N	10038	\N	\N	\N	\N	\N	\N
760	4850230829	40.7061594	-74.008845	\N	\N	\N	\N	Starbucks	+13474614068	\N	10005	\N	\N	\N	\N	\N	\N
761	4850904724	40.8001351	-73.9677641	\N	2730	\N	Broadway	Plowshares Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
762	4860132622	40.7080709	-74.0137437	\N	94	\N	Greenwich Street	Siena Bakehouse	\N	\N	10006	\N	\N	\N	\N	\N	\N
763	4867347824	40.7443589	-73.9315047	\N	3306	\N	Queens Boulevard	Fresco	\N	\N	\N	\N	\N	\N	\N	\N	\N
764	4868108422	40.6439175	-74.0724838	\N	\N	\N	\N	Ferris Wheel	\N	\N	\N	\N	\N	\N	\N	\N	\N
765	4868117621	40.6439276	-74.0777852	\N	\N	\N	\N	Mike Food Deli	+1 347 286 07 37	\N	\N	\N	\N	\N	\N	\N	\N
766	4870096822	40.5835532	-73.9510784	Brooklyn	1715	NY	Emmons Avenue	Wildberry	+1 516-754-0661	\N	11235	\N	\N	\N	\N	\N	\N
767	4870280864	40.7631599	-74.0005711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
768	4875126273	40.7469708	-73.9853055	\N	315	\N	5th Avenue	Ginseng Museum Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
769	4894493421	40.7144862	-73.9821342	\N	\N	\N	\N	Ost Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
770	4899954121	40.7037798	-74.0109286	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	4909121424	40.7036165	-74.0103766	\N	\N	\N	\N	Ground Central	+1-212-344-0237	\N	\N	\N	\N	\N	\N	\N	\N
772	4909655521	40.7349281	-74.0022788	\N	44	\N	Charles Street	Partners Coffee	+1 646-590-1924	\N	\N	\N	\N	\N	\N	\N	\N
773	4913377823	40.7041988	-74.0117201	\N	\N	\N	\N	Gregorys Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
774	4915258225	40.7069204	-74.0067667	\N	101	\N	Maiden Lane	Juice Generation	+1-646-882-4330	\N	10038	\N	\N	\N	\N	\N	\N
775	4915759323	40.7029481	-73.9874794	Brooklyn	57B	NY	Pearl Street	Archway Cafe	+1-718-522-3455	\N	11201	\N	\N	\N	\N	\N	\N
776	4922311223	40.6924431	-73.9912239	Brooklyn	50	NY	Court Street	Starbucks	+1 718-855-0369	\N	11201	\N	\N	\N	\N	\N	\N
777	4922311227	40.7273626	-73.9888015	\N	101	\N	2nd Avenue	787 Coffee	+1-646-838-9890	\N	10003	\N	\N	\N	\N	\N	\N
778	4922311233	40.7351434	-73.9897998	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
779	4922439621	40.7050363	-74.0068254	\N	100	\N	Wall Street	Gregorys Coffee	+16469187274	\N	10005	\N	\N	\N	\N	\N	\N
780	4924481993	40.8080617	-73.963265	\N	2960	\N	Broadway	Joe Coffee Company	\N	\N	10027	\N	\N	\N	\N	\N	\N
781	4931671022	40.6299439	-73.9215503	\N	\N	\N	\N	Buffet	\N	\N	\N	\N	\N	\N	\N	\N	\N
782	4931686522	40.7407674	-73.9918982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
783	4938355321	40.7700007	-73.9184132	Astoria	30-18	NY	Astoria Boulevard	Starbucks	+1 718-278-1518	\N	11102	\N	\N	\N	\N	\N	\N
784	4942076011	40.7677239	-73.911692	Astoria	2503	NY	Steinway Street	Sultana Cafe	\N	\N	11103	\N	\N	\N	\N	\N	\N
785	4942694536	40.7039608	-74.0118856	New York	20	NY	Stone Street	Café Grumpy	+1-646-838-9306	\N	10004	\N	\N	\N	\N	\N	\N
786	4944843921	40.7270679	-73.9893826	\N	239	\N	East 5th Street	Coffee Project NY	+1-212-228-7888	\N	10003	\N	\N	\N	\N	\N	\N
787	4950995921	40.7290639	-73.9784477	New York	222	NY	Avenue B	The Roost	+1-646-918-6700	\N	10009	\N	\N	\N	\N	\N	\N
788	4951636221	40.7609195	-73.7665147	Bayside	215-29	NY	Northern Boulevard	Starbucks	+1 718-281-4165	\N	11361	\N	\N	\N	\N	\N	\N
789	4953971785	40.8105082	-73.9395267	\N	\N	\N	\N	OurtBox Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
790	4957074132	40.7684196	-73.9851251	New York	370	NY	West 58th Street	Amore Pizza Cafe	+1-212-581-4200	\N	10019	\N	\N	\N	\N	\N	\N
791	4959225990	40.7608993	-73.8270495	Flushing	39-02	NY	Union Street	Tous les Jours	718-762-6557	\N	11354	\N	\N	\N	\N	\N	\N
792	4966951439	40.7602638	-73.918128	Astoria	31-44	NY	Steinway Street	Starbucks	+1 718-274-5700	\N	11103	\N	\N	\N	\N	\N	\N
793	4987290427	40.564523	-73.9102081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
794	4995738112	40.6087764	-73.9585757	Brooklyn	1417	NY	Kings Highway	Starbucks	+1 718-690-3759	\N	11229	\N	\N	\N	\N	\N	\N
795	4995839314	40.7483354	-73.9494339	\N	\N	\N	\N	The Mill	\N	\N	\N	\N	\N	\N	\N	\N	\N
796	4995844725	40.7478123	-73.9476249	\N	\N	\N	\N	Yi Fang	\N	\N	\N	\N	\N	\N	\N	\N	\N
797	4995849481	40.7624366	-73.9739908	New York	600	NY	Madison Avenue	Starbucks	+1 212-759-1569	\N	10022	\N	\N	\N	\N	\N	\N
798	4998805612	40.7327767	-73.9910309	\N	816	\N	Broadway	Outro	\N	\N	\N	\N	\N	\N	\N	\N	\N
799	4998805616	40.7326431	-73.9914153	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
800	5043497801	40.6668209	-73.9818315	Brooklyn	444	NY	9th Street	Starbucks	+1 929-214-8871	\N	11215	\N	\N	\N	\N	\N	\N
801	5052125055	40.7305282	-73.9517696	Brooklyn	195	NY	Greenpoint Avenue	Pueblo Querido	+1-929-346-2986	\N	11222	\N	\N	\N	\N	\N	\N
802	5063258515	40.7450889	-73.9038325	\N	60-15	\N	Woodside Avenue	Cornerstone Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
803	5065571121	40.66999	-73.9583748	\N	818	\N	Franklin Avenue	Agi''s Counter	+1-718-822-7833	\N	11225	\N	\N	\N	\N	\N	\N
804	5082105221	40.7403729	-73.937536	\N	30-18	\N	Hunters Point Avenue	Griddle Cafe & Deli	+17189377947	\N	11101	\N	\N	\N	\N	\N	\N
805	5082832236	40.7452314	-73.9054991	\N	59-02	\N	Woodside Avenue	Dear Han	\N	\N	\N	\N	\N	\N	\N	\N	\N
806	5083557375	40.7586389	-73.9194747	\N	32-14	\N	Steinway Street	Que Rico	+1 718-255-1541	\N	\N	\N	\N	\N	\N	\N	\N
807	5087340921	40.7246703	-73.9511656	\N	664	\N	Manhattan Avenue	Bot Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
808	5090743953	40.7786181	-73.9559843	New York	1261	NY	Lexington Avenue	Starbucks	+1 212-879-1764	\N	10028	\N	\N	\N	\N	\N	\N
809	5091148526	40.6927399	-73.9404432	\N	907	\N	DeKalb Avenue	Mary''s Coffee Shop	+1-917-893-9559	\N	\N	\N	\N	\N	\N	\N	\N
810	5092488424	40.7434084	-73.9183013	Sunnyside	46-09	NY	Queens Boulevard	Starbucks	+1 718-472-5215	\N	11104	\N	\N	\N	\N	\N	\N
811	5093178522	40.7243937	-73.9510032	\N	\N	\N	\N	Acai Berry	\N	\N	\N	\N	\N	\N	\N	\N	\N
812	5101542622	40.7081578	-74.0139728	\N	16	\N	Rector Street	\N	\N	\N	10006	\N	\N	\N	\N	\N	\N
813	5104089343	40.7665842	-73.9125947	\N	25-51	\N	Steinway Street	Cafe Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
814	5104092315	40.769666	-73.9111067	\N	38-01	\N	Astoria Boulevard	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
815	5104099243	40.6693658	-73.9898225	Brooklyn	476	NY	4th Avenue	Starbucks	+1 929-214-9558	\N	11215	\N	\N	\N	\N	\N	\N
816	5111788798	40.7702499	-73.9182902	Astoria	30-19	NY	Astoria Boulevard	Veracruzano	+1 718-440-9150	\N	11102	\N	\N	\N	\N	\N	\N
817	5120608722	40.7209019	-73.9946997	\N	170	\N	Elizabeth Street	Black Seed Bagels	+1 212-730-1950	\N	10012	\N	\N	\N	\N	\N	\N
818	5123325421	40.7294074	-73.8613206	Rego Park	96-40	\N	Queens Boulevard	Cafe Mocha	+1 718 685 2927	\N	11374	\N	\N	\N	\N	\N	\N
819	5126272537	40.7130523	-74.0096369	\N	\N	\N	\N	Aroma Espresso Bar	\N	\N	10007	\N	\N	\N	\N	\N	\N
820	5132368123	40.7175925	-73.9971381	\N	106	\N	Mott Street	Sweet Moment	\N	\N	10013	\N	\N	\N	\N	\N	\N
821	5136315012	40.7580814	-73.9235018	\N	35-13	\N	34th Avenue	Sweet Scene	\N	\N	\N	\N	\N	\N	\N	\N	\N
822	5145299521	40.7417897	-73.9807467	\N	200	\N	East 28th Street	Starbucks	\N	\N	10016	\N	\N	\N	\N	\N	\N
823	5152969390	40.6286385	-74.0798621	\N	387	\N	Van Duzers	Duzer''s Local Cafe & Market	\N	\N	\N	\N	\N	\N	\N	\N	\N
824	5155255411	40.7596918	-73.7724531	\N	210-21	\N	Northern Boulevard	Bean Square	\N	\N	\N	\N	\N	\N	\N	\N	\N
825	5155761608	40.7494987	-73.897702	\N	64-23	\N	Broadway	Woodside Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
826	5156147426	40.7657215	-73.9191914	\N	33-20	\N	30th Avenue	La Sabrosura	\N	\N	\N	\N	\N	\N	\N	\N	\N
827	5156180444	40.7659528	-73.9190629	\N	33-17	\N	30th Avenue	The Teapsy	\N	\N	\N	\N	\N	\N	\N	\N	\N
828	5159087925	40.605577	-74.0006319	Brooklyn	8611	NY	19th Avenue	At Your Mother-in-Law	+1-646-575-7153	\N	11214	\N	\N	\N	\N	\N	\N
829	5159984903	40.7668872	-73.9210453	\N	31-03	\N	30th Avenue	Freddo Coffee Pot Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	5160028818	40.7577198	-73.9631297	New York	\N	NY	1st Avenue	Sutton Cafe Restaurant	\N	\N	10022	\N	\N	\N	\N	\N	\N
831	5160036929	40.8454043	-73.7859814	\N	249	\N	City Island Avenue	Starving Artist Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
832	5163776190	40.6936921	-73.9297143	\N	1120	\N	Broadway	BK Bagel	+1-718-443-2323	\N	\N	\N	\N	\N	\N	\N	\N
833	5163830490	40.6962604	-73.9049682	\N	983	\N	Wyckoff Avenue	C & B Luncheonette	7184976561	\N	\N	\N	\N	\N	\N	\N	\N
834	5163876845	40.6921888	-73.9265577	\N	1207	\N	Broadway	Hearts Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
835	5163878627	40.7033994	-73.9261758	\N	211	\N	Knickerbocker Avenue	Foster Sundry	\N	\N	\N	\N	\N	\N	\N	\N	\N
836	5163989224	40.7192673	-74.0060718	\N	227	\N	West Broadway	Cafe Clementine	+1-212-965-0909	\N	\N	cafeclementinenyc@gmail.com	\N	\N	\N	\N	\N
837	5170130279	40.7693293	-73.914814	\N	35-02	\N	Astoria Boulevard	Lemonia Cafe	+1-347-396-5669	\N	\N	\N	\N	\N	\N	\N	\N
838	5178499860	40.7061395	-73.9224225	Brooklyn	30	NY	Wyckoff Avenue	Wyckoff Starr	+1-718-484-9766	\N	11237	\N	\N	\N	\N	\N	\N
839	5190573515	40.9036884	-73.8503704	\N	4703	\N	White Plains Road	Café Restaurant	\N	\N	\N	\N	\N	\N	\N	\N	\N
840	5190720806	40.7485816	-73.9863247	New York	\N	NY	West 33rd Street	Kawande Martin Cafe	\N	\N	10001	\N	\N	\N	\N	\N	\N
841	5197668411	40.8340109	-73.8520735	\N	2166	\N	Westchester Avenue	Caffé Lanka	\N	\N	10462	\N	\N	\N	\N	\N	\N
842	5203205582	40.6723067	-73.9772577	Brooklyn	156	NY	7th Avenue	Hungry Ghost	\N	\N	11215	\N	\N	\N	\N	\N	\N
843	5206186282	40.6604123	-73.9801749	\N	211	\N	Prospect Park West	Betty Bakery	\N	\N	11215	\N	\N	\N	\N	\N	\N
844	5206200598	40.6938006	-73.9639513	\N	519	\N	Myrtle Avenue	Calyer Cafe & Kitchen	+1-718-576-3086	\N	11205	\N	\N	\N	\N	\N	\N
845	5213287048	40.6920497	-73.9429155	\N	356	\N	Throop Avenue	Burly Coffee	+1-718-388-0013	\N	11221	info@burlycoffee.com	\N	\N	\N	\N	\N
846	5216100926	40.7420228	-74.005159	\N	75	\N	9th Avenue	Creamline	\N	\N	\N	\N	\N	\N	\N	\N	\N
847	5218846563	40.6000144	-73.9902745	Brooklyn	2349	NY	86th Street	Mr & Miss Cafe	\N	\N	11214	\N	\N	\N	\N	\N	\N
848	5218862261	40.5928524	-73.9881893	\N	2611	\N	Bath Avenue	Memories	\N	\N	\N	\N	\N	\N	\N	\N	\N
849	5218863424	40.5997337	-73.9898377	Brooklyn	2365	NY	86th Street	Kowloon Cafe	\N	\N	11214	\N	\N	\N	\N	\N	\N
850	5222613656	40.7207973	-73.9972546	New York	398	NY	Broome Street	The Lost Draft	+1-646-524-6021	\N	10013	\N	\N	\N	\N	\N	\N
851	5227527424	40.7198938	-74.0038297	New York	319	NY	Church Street	La Colombe Coffee Roasters	\N	\N	10013	\N	\N	\N	\N	\N	\N
852	5228777785	40.7525184	-73.9860712	\N	\N	\N	\N	Tim Hortons	\N	\N	\N	\N	\N	\N	\N	\N	\N
853	5229539586	40.6268998	-73.9762242	\N	1081	\N	McDonald Avenue	The Little Things	\N	\N	\N	\N	\N	\N	\N	\N	\N
854	5229541226	40.635727	-73.9778996	\N	757	\N	McDonald Avenue	Gabby''s Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
855	5229541507	40.6319734	-73.995071	\N	5405	\N	13th Avenue	1982 Coffee Roasters	+1-718-475-1982	\N	\N	\N	\N	\N	\N	\N	\N
856	5229546633	40.6351466	-73.9957876	\N	5106	\N	12th Avenue	The Chocolate Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
857	5231705717	40.7149276	-73.9983164	\N	26	\N	Pell Street	Mee Sum Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
858	5236507097	40.6669271	-73.9918474	\N	548	\N	4th Avenue	The Common	+1-718-971-9580	\N	11215	\N	\N	\N	\N	\N	\N
859	5243548102	40.7190103	-73.9845737	New York	172	NY	Rivington Street	Black Cat LES	+1-646-918-7711	\N	10002	\N	\N	\N	\N	\N	\N
860	5243561776	40.7143078	-73.9903911	New York	26	NY	Canal Street	Little Canal	+1 917-472-7479	\N	10002	\N	\N	\N	\N	\N	\N
861	5243567855	40.727163	-73.9999069	\N	88	\N	West Houston Street	Morgenstern''s Finest Ice Cream	+1-212-209-7684	\N	\N	\N	\N	\N	\N	\N	\N
862	5243646756	40.6549339	-73.9735328	\N	\N	\N	\N	Elk	+1-718-853-5500	\N	\N	\N	\N	\N	\N	\N	\N
863	5248100573	40.7298789	-73.862735	Rego Park	95-17	NY	63rd Drive	Starbucks	+1 347-757-0261	\N	11374	\N	\N	\N	\N	\N	\N
864	5265713044	40.7292145	-73.9981725	\N	552	\N	LaGuardia Place	Chihiro Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
865	5265713182	40.7191024	-73.9970647	New York	195	NY	Grand Street	Ferrara	+1 212-226-6150	\N	10013	\N	\N	\N	\N	\N	\N
866	5265714493	40.720329	-73.9967563	\N	385	\N	Broome Street	Cafe Roma	\N	\N	\N	\N	\N	\N	\N	\N	\N
867	5265747703	40.7388326	-73.9955295	\N	590	\N	6th Avenue	Coffeed	\N	\N	10011	\N	\N	\N	\N	\N	\N
868	5265747921	40.7384445	-73.9958164	\N	568	\N	6th Avenue	Think Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
869	5266896777	40.7667816	-73.9564416	\N	1302	\N	1st Avenue	Coffee Inn	\N	\N	\N	\N	\N	\N	\N	\N	\N
870	5269083208	40.8012383	-73.9421403	\N	1694	\N	Park Avenue	Bitter Orange Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
871	5269083757	40.8006177	-73.9426122	\N	1674	\N	Park Avenue	UGC Eats	\N	\N	\N	\N	\N	\N	\N	\N	\N
872	5269095866	40.7971288	-73.9384911	\N	242	\N	East 116th Street	Capy	\N	\N	\N	\N	\N	\N	\N	\N	\N
873	5276454721	40.727568	-73.9528273	\N	\N	\N	\N	Baker’s Dozen	\N	\N	\N	\N	\N	\N	\N	\N	\N
874	5281909155	40.8242066	-73.9456088	New York	410	NY	West 145th Street	Sugar Hill Café	\N	\N	10031	\N	\N	\N	\N	\N	\N
875	5320691264	40.6766184	-73.9801521	\N	\N	\N	\N	Volare	+1-347-227-8123	\N	\N	\N	\N	\N	\N	\N	\N
876	5320706863	40.6768978	-73.9799639	\N	187	\N	5th Avenue	Konditori	+1-347-384-2028	\N	11217	\N	\N	\N	\N	\N	\N
877	5328220836	40.6741895	-73.9754853	\N	97	\N	7th Avenue	Art Collectve Cafe	\N	\N	11215	\N	\N	\N	\N	\N	\N
878	5328483492	40.7538023	-73.9851089	\N	\N	\N	\N	L’Adresse American Bistro	\N	\N	\N	\N	\N	\N	\N	\N	\N
879	5331099591	40.7660721	-73.9130283	\N	25-73	\N	Steinway Street	Mokafé	+1 718-489-0242	\N	\N	\N	\N	\N	\N	\N	\N
880	5333551106	40.7505545	-73.9702839	New York	\N	\N	\N	Mona	\N	\N	10017	\N	\N	\N	\N	\N	\N
881	5334051621	40.7087364	-74.0069962	\N	110	\N	William Street	Voyager Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
882	5343852056	40.7073005	-73.8969064	Ridgewood	61-05	NY	Madison Street	The Spot	+1-929-228-9957	\N	11385	\N	\N	\N	\N	\N	\N
883	5346841821	40.6531009	-73.9759494	\N	\N	\N	\N	Poetica Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
884	5348392455	40.7006712	-73.9038041	\N	905	\N	Seneca Avenue	Rudy''s Pastry Shop	+1 718-821-5890	\N	\N	\N	\N	\N	\N	\N	\N
885	5349396115	40.6970156	-73.9062504	Ridgewood	915	NY	Wyckoff Avenue	Trans Am Cafe	+1-718-386-3718	\N	11385	\N	\N	\N	\N	\N	\N
886	5351612917	40.7066709	-73.8972292	\N	66-72	\N	Fresh Pond Road	The Nest Fine Desserts	7184189493	\N	\N	\N	\N	\N	\N	\N	\N
887	5351619383	40.7068651	-73.8969118	Ridgewood	66-69	NY	Fresh Pond Road	Cute Cat Café	+1-718-417-7500	\N	11385	\N	\N	\N	\N	\N	\N
888	5351859759	40.6743416	-73.9525653	Brooklyn	724	NY	Prospect Place	Cafe con Libros	+1 (347) 460-2838	\N	11216	\N	\N	\N	\N	\N	\N
889	5353556284	40.6786774	-73.9107645	Brooklyn	38	NY	Somers Street	Daily Press Ocean Hill	+1 (347) 442-1410	\N	11233	\N	\N	\N	\N	\N	\N
890	5358087423	40.7448363	-74.0028199	New York	177	NY	9th Avenue	La Bergamote	+1 212-627-9010	\N	10011	\N	\N	\N	\N	\N	\N
891	5364870785	40.7007358	-73.8966268	Ridgewood	60-47	NY	Myrtle Avenue	AMA Coffee	+1 917-868-4686	\N	11385	\N	\N	\N	\N	\N	\N
892	5364972600	40.7080471	-73.8979865	Ridgewood	66-30	NY	Fresh Pond Road	Spolem Café and Lounge	+1-347-725-3379	\N	11385	\N	\N	\N	\N	\N	\N
893	5365021891	40.7056597	-73.9153112	Ridgewood	17-02	NY	Cypress Avenue	Cypress Inn Cafe	+1-347-889-5676	\N	11385	\N	\N	\N	\N	\N	\N
1169	6001361798	40.7154345	-74.01633	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
894	5365035494	40.7023975	-73.9008093	Ridgewood	59-02	NY	Catalpa Avenue	Norma''s Corner Shoppe	+1-347-294-0185	\N	11385	\N	\N	\N	\N	\N	\N
895	5365041381	40.7014113	-73.8887535	Glendale	65-53	NY	Myrtle Avenue	Evertz''s Cafe Restaurant	\N	\N	11385	\N	\N	\N	\N	\N	\N
896	5367308116	40.680502	-73.9778454	\N	\N	\N	\N	Java Andina	\N	\N	\N	\N	\N	\N	\N	\N	\N
897	5368647549	40.6788171	-73.986241	\N	\N	\N	\N	Mirror Tea and Sake House	+1-917-909-0557	\N	\N	\N	\N	\N	\N	\N	\N
898	5368787741	40.7017554	-73.9061681	\N	778	\N	Seneca Avenue	Milk & Pull	+1-718-821-1155	\N	\N	\N	\N	\N	\N	\N	\N
899	5373522803	40.7092698	-73.9042364	\N	63-59	\N	Forest Avenue	Rogner Cafe and Lounge	\N	\N	\N	\N	\N	\N	\N	\N	\N
900	5373644722	40.604355	-73.9719259	Brooklyn	481	NY	Kings Highway	Starbucks	\N	\N	11223	\N	\N	\N	\N	\N	\N
901	5378336828	40.7072182	-73.9147797	\N	377	\N	Seneca Avenue	Bravo''s Café and Restaurant	+1-718-821-0492	\N	\N	\N	\N	\N	\N	\N	\N
902	5383045522	40.7251418	-73.98162	New York	178	NY	East 7th Street	C&B	\N	\N	10009	\N	\N	\N	\N	\N	\N
903	5395639744	40.7270961	-73.993997	\N	372	\N	Lafayette Street	Honeybrains	\N	\N	10012	\N	\N	\N	\N	\N	\N
904	5397270880	40.7294568	-73.9881288	New York	230	NY	East 9th Street	Cha-An Teahouse	+1 212-228-8030	\N	10003	info@chaanteahouse.com	\N	\N	\N	\N	\N
905	5397494204	40.760603	-73.8329669	\N	37-06	\N	Prince Street	KULU Desserts Flushing	(718) 886-3302	\N	11354	\N	\N	\N	\N	\N	\N
906	5399823086	40.7242595	-74.0019929	\N	399	\N	West Broadway	Ground Support Café	+1-212-219-8733	\N	\N	steven@groundsupportcafe.com	\N	\N	\N	\N	\N
907	5400446681	40.7413267	-73.9216544	Sunnyside	43-04	NY	47th Avenue	Curley''s Bagels	\N	\N	11104	\N	\N	\N	\N	\N	\N
908	5401946294	40.7392879	-74.001853	\N	\N	\N	\N	Big Famous Deli & Grocery	2127418065	\N	\N	\N	\N	\N	\N	\N	\N
909	5401978031	40.7620536	-73.9910987	\N	\N	\N	\N	Al Horno	+1 212-977-1000	\N	\N	\N	\N	\N	\N	\N	\N
910	5403591848	40.7585227	-73.9195571	\N	32-18	\N	Steinway Street	Bora Bora Smoothie Cafe	\N	\N	11103	\N	\N	\N	\N	\N	\N
911	5406249571	40.7373286	-73.877157	\N	86-55	\N	Broadway	KULU Desserts Elmhurst	\N	\N	\N	\N	\N	\N	\N	\N	\N
912	5406249605	40.7669524	-73.912706	\N	25-42	\N	Steinway Street	Dream Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
913	5406250237	40.7564484	-73.9212667	\N	34-10	\N	Steinway Street	Steinway Coffee Shop	+1-718-361-7770	\N	\N	\N	\N	\N	\N	\N	\N
914	5408681221	40.7026645	-73.9908577	Brooklyn	67	NY	Front Street	Starbucks	+1 718-855-0856	\N	11201	\N	\N	\N	\N	\N	\N
915	5413416238	40.6155469	-73.9998538	\N	7501	\N	New Utrecht Avenue	Bagels Plus	\N	\N	11214	\N	\N	\N	\N	\N	\N
916	5413546871	40.7025203	-73.9129232	Ridgewood	259	NY	St. Nicholas Avenue	Chispa	\N	\N	11385	\N	\N	\N	\N	\N	\N
917	5414456109	40.8510936	-73.9384166	New York	803	NY	West 181st Street	Starbucks	+1 212-927-4272	\N	10033	\N	\N	\N	\N	\N	\N
918	5415638323	40.767622	-73.9117641	\N	25-07	\N	Steinway Street	Caffé Borbone	+1-718-777-1023	\N	\N	\N	\N	\N	\N	\N	\N
919	5415647133	40.715278	-74.0074529	New York	165	NY	Church Street	Hungry Ghost	\N	\N	10007	\N	\N	\N	\N	\N	\N
920	5415649562	40.719848	-74.0049417	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
921	5417695324	40.7088486	-73.8981061	\N	66-07	\N	Fresh Pond Road	European Coffee Bar	+1-718-418-8457	\N	\N	\N	\N	\N	\N	\N	\N
922	5418882814	40.7063536	-73.9054469	Ridgewood	660	NY	Fairview Avenue	C.Lo Cafe	+1-929-295-0099	\N	11385	\N	\N	\N	\N	\N	\N
923	5423595681	40.7118667	-73.9057757	Ridgewood	62-54	NY	Forest Avenue	L''aroma Dei Cafe	+1-718-456-9788	\N	11385	\N	\N	\N	\N	\N	\N
924	5425572212	40.755117	-73.9909801	\N	270	\N	West 39th Street	Corvo Coffee	+1-917-409-2479	\N	\N	\N	\N	\N	\N	\N	\N
925	5425892273	40.6940674	-73.8507034	\N	94-16	\N	Jamaica Avenue	Independence Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
926	5433332835	40.7554688	-73.9707954	\N	\N	\N	\N	The Picnic Basket	\N	\N	\N	\N	\N	\N	\N	\N	\N
927	5433333128	40.7563262	-73.9803251	\N	\N	\N	\N	Gotan	\N	\N	\N	\N	\N	\N	\N	\N	\N
928	5443670322	40.705529	-74.008115	\N	65E	\N	Wall Street	Joe & The Juice	\N	\N	10005	\N	\N	\N	\N	\N	\N
929	5453156336	40.75932	-73.8302071	Flushing	40-06	NY	Main Street	Maxin Bakery	\N	\N	11354	\N	\N	\N	\N	\N	\N
930	5454117997	40.7604123	-73.8303723	\N	38-19	\N	Main Street	Song Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
931	5455223691	40.6612944	-73.9968528	\N	719	\N	4th Avenue	Tin Cup Cafe	+1-347-725-3506	\N	\N	\N	\N	\N	\N	\N	\N
932	5457976615	40.7607508	-73.8305309	Flushing	38-05	NY	Main Street	Starbucks	+1 718-445-0354	\N	11354	\N	\N	\N	\N	\N	\N
933	5470130892	40.7036304	-73.8088849	Jamaica	8900	NY	Sutphin Boulevard	Starbucks	+1 347-233-1463	\N	11435	\N	\N	\N	\N	\N	\N
934	5473383610	40.739498	-74.007702	New York	73	NY	Gansevoort Street	\N	\N	\N	10014	\N	\N	\N	\N	\N	\N
935	5474081137	40.6828823	-73.9821946	\N	\N	\N	\N	Lano''s Coffee Shop & Restaurant	+1 718 643 3617	\N	\N	\N	\N	\N	\N	\N	\N
936	5477794022	40.7167956	-73.951889	\N	544	\N	Union Avenue	Reunion	7185993670	\N	11211	\N	\N	\N	\N	\N	\N
937	5481496774	40.7658549	-73.9195051	\N	33-10	\N	30th Avenue	New York City Bagel Coffee House	\N	\N	11103	\N	\N	\N	\N	\N	\N
938	5481546589	40.7033726	-73.9904309	\N	35	\N	Water Street	One Girl Cookies	+1-212-675-4996	\N	\N	\N	\N	\N	\N	\N	\N
939	5487146971	40.6796283	-73.9822309	\N	333	\N	Douglass Street	Ninth Street Espresso	\N	\N	11217	\N	\N	\N	\N	\N	\N
940	5494239445	40.6638024	-73.9910869	\N	\N	\N	\N	Marte''s Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
941	5500393532	40.7029465	-73.9894489	\N	45	\N	Washington Street	Joe Coffee	\N	\N	11201	\N	\N	\N	\N	\N	\N
942	5506774601	40.6716935	-73.9840041	\N	\N	\N	\N	Café Martin	\N	\N	\N	\N	\N	\N	\N	\N	\N
943	5517079878	40.6721221	-73.9769228	\N	\N	\N	\N	Un Posto Italiano	+1-718-638-8500	\N	\N	\N	\N	\N	\N	\N	\N
944	5518770599	40.6751381	-73.975415	\N	\N	\N	\N	Cafe Regular du Nord	+1-718-783-0673	\N	\N	regulardunord@gmail.com	\N	\N	\N	\N	\N
945	5521624421	40.6897579	-73.98015	Brooklyn	80	NY	DeKalb Avenue	Hungry Ghost	\N	\N	11201	\N	\N	\N	\N	\N	\N
946	5523537866	40.6722582	-73.9682033	\N	\N	\N	\N	Emma''s Torch Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
947	5526341737	40.6662534	-73.9852422	\N	497	\N	6th Avenue	Muse	+1 718 788 5800	\N	11215	\N	\N	\N	\N	\N	\N
948	5528518947	40.6841419	-73.9835836	Brooklyn	253	NY	Bergen Street	Blank Street Coffee	\N	\N	11217	\N	\N	\N	\N	\N	\N
949	5528676228	40.7579702	-73.9838946	\N	136	\N	West 46th Street	Margon Restaurant	\N	\N	\N	\N	\N	\N	\N	\N	\N
950	5530476452	40.5421015	-74.2069369	Staten Island	1243	NY	Woodrow Road	Starbucks	+1 929-321-0457	\N	10309	\N	\N	\N	\N	\N	\N
951	5531185014	40.7030612	-73.9078624	\N	685	\N	Seneca Avenue	#1 Natural Juice Bar	+1-347-956-5161	\N	\N	\N	\N	\N	\N	\N	\N
952	5534031217	40.7085319	-73.9146219	Ridgewood	353	NY	Onderonk Avenue	Onderdonk Cafe	\N	\N	11385	\N	\N	\N	\N	\N	\N
953	5538367714	40.6893231	-73.9809019	Brooklyn	395	NY	Flatbush Avenue Extension	Starbucks	+1 718-858-8070	\N	11201	\N	\N	\N	\N	\N	\N
954	5539074684	40.8003172	-73.9618481	New York	973	NY	Columbus Avenue	Demitasse Cafe	\N	\N	10025	\N	\N	\N	\N	\N	\N
955	5541293168	40.6727007	-73.9798336	\N	287	\N	6th Avenue	Blank Street Coffee	\N	\N	11215	\N	\N	\N	\N	\N	\N
956	5541522600	40.6994051	-73.9140057	\N	1533	\N	Myrtle Avenue	Mixtape Bushwick	+1-718-381-5248	\N	\N	\N	\N	\N	\N	\N	\N
957	5542976159	40.6998162	-73.9112732	Ridgewood	329	NY	Wyckoff Avenue	Starbucks	+1 347-668-5736	\N	11385	\N	\N	\N	\N	\N	\N
958	5548940330	40.8327142	-73.8639673	\N	1859	\N	Westchester Avenue	Isla Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
959	5549150574	40.6778577	-73.9796531	\N	\N	\N	\N	Everyman Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
960	5552408327	40.8277423	-73.8502782	Bronx	1001	NY	Castle Hill Avenue	Johnny''s Grand Cafe	+1-718-319-1200	\N	10472	\N	\N	\N	\N	\N	\N
1170	6003410969	40.6748895	-73.9889741	\N	\N	\N	\N	Allegro Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
961	5554842593	40.7049338	-73.9175904	\N	140	\N	Saint Nicholas Avenue	Gordo’s Cantina	+1-718-484-8183	\N	\N	\N	\N	\N	\N	\N	\N
962	5555271895	40.6774606	-73.9835377	\N	620	\N	Union Street	Beanmonger Coffee	\N	\N	11215	\N	\N	\N	\N	\N	\N
963	5558007858	40.6810156	-73.9941909	\N	\N	\N	\N	Bagels Cafe	+1-718-246-1321	\N	\N	\N	\N	\N	\N	\N	\N
964	5564035840	40.8750868	-73.8793015	\N	3150	\N	Bainbridge Avenue	New Star Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
965	5573636404	40.7832735	-73.9480375	\N	1821	\N	2nd Avenue	Yorkville Bagel & Cafe	+1 212-996-6544	\N	10128	yorkvillebagel@gmail.com	\N	\N	\N	\N	\N
966	5574466300	40.651416	-74.0077637	\N	\N	\N	\N	Slimāk	+1-718-689-3332	\N	\N	\N	\N	\N	\N	\N	\N
967	5578984004	40.7530165	-73.984168	\N	54	\N	West 40th Street	Blue Bottle Coffee	+1-510-653-3394	\N	10018	\N	\N	\N	\N	\N	\N
968	5585248522	40.7007786	-73.9883118	\N	55	\N	Prospect Street	Bluestone Lane	+1-718-374-6858	\N	11201	\N	\N	\N	\N	\N	\N
969	5585374466	40.7216695	-73.9873956	New York	176	NY	Ludlow Street	Ludlow Coffee Supply	+1-917-472-7632	\N	10002	\N	\N	\N	\N	\N	\N
970	5585532432	40.7038562	-73.9869538	Brooklyn	163	NY	Plymouth Street	Design Cafe Usagi	\N	\N	11201	\N	\N	\N	\N	\N	\N
971	5587111257	40.7291434	-73.999255	New York	217	NY	Thompson Street	Debutea	(646) 767-0147	\N	10012	\N	\N	\N	\N	\N	\N
972	5596917758	40.6720276	-73.9774986	Brooklyn	166	NY	7th Avenue	Starbucks	+1 718-369-3098	\N	11215	\N	\N	\N	\N	\N	\N
973	5597395539	40.703584	-73.9174318	\N	340	\N	Stanhope Street	C M Coffee Shop	+1-718-381-0262	\N	\N	\N	\N	\N	\N	\N	\N
974	5597414426	40.6836705	-73.9326645	\N	558	\N	\N	Rita & Maria	\N	\N	\N	\N	\N	\N	\N	\N	\N
975	5597414492	40.7086912	-73.8693224	\N	80-00	\N	Cooper Avenue	Starbucks	+1-718-416-1521	\N	\N	\N	\N	\N	\N	\N	\N
976	5599264049	40.7827156	-73.9484523	New York	245	NY	East 93rd Street	Starbucks	+1 646-455-8766	\N	10128	\N	\N	\N	\N	\N	\N
977	5599496976	40.7628613	-73.985265	New York	253	NY	West 51st Street	Bibble & Sip	+1-646-649-5116	\N	10019	\N	\N	\N	\N	\N	\N
978	5600182561	40.6918082	-73.9399409	\N	186	\N	Marcus Garvey Boulevard	Fermento	\N	\N	\N	\N	\N	\N	\N	\N	\N
979	5600183533	40.6907527	-73.9557871	\N	520	\N	DeKalb Avenue	Brooklyn Kolache	\N	\N	\N	\N	\N	\N	\N	\N	\N
980	5600185437	40.6892648	-73.9512084	\N	279	\N	Nostrand Avenue	The Bureau	\N	\N	11216	\N	\N	\N	\N	\N	\N
981	5600185450	40.6897553	-73.9513054	\N	261	\N	Nostrand Avenue	Nostrand Coffee Roaster	\N	\N	11216	\N	\N	\N	\N	\N	\N
982	5600185466	40.6865989	-73.9547153	Brooklyn	1114	NY	Bedford Avenue	Playground Coffee Shop	+1-718-484-4833	\N	11216	\N	\N	\N	\N	\N	\N
983	5601037419	40.7867898	-73.822062	\N	145-04	\N	14th Avenue	The Stonebridge	\N	\N	\N	\N	\N	\N	\N	\N	\N
984	5603534984	40.7292335	-73.9814002	New York	195	NY	Avenue A	Boris and Horton	\N	\N	10009	\N	\N	\N	\N	\N	\N
985	5603563258	40.7268161	-73.9831737	New York	125	NY	Saint Mark''s Place	Starbucks	+1 917-648-3955	\N	10009	\N	\N	\N	\N	\N	\N
986	5611592932	40.6824544	-73.9613917	\N	1013	\N	Fulton Street	Maya Congee Café	\N	\N	11238	\N	\N	\N	\N	\N	\N
987	5611937541	40.7265689	-73.9996226	New York	71	NY	West Houston Street	Birch Coffee	+1 212-686-1444	\N	10012	soho@birchcoffee.com	\N	\N	\N	\N	\N
988	5613044405	40.7073204	-73.9537223	\N	308	\N	Hooper Street	The Fiction	\N	\N	11211	\N	\N	\N	\N	\N	\N
989	5614134321	40.7345353	-73.9553797	\N	\N	\N	\N	Sweetleaf Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
990	5617797691	40.6355039	-74.025973	\N	6903	\N	3rd Avenue	Coffee Rx	+1 646-820-8095	\N	11209	\N	\N	\N	\N	\N	\N
991	5618064691	40.7802595	-73.9635992	\N	\N	\N	\N	American Wing Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
992	5618087850	40.7791519	-73.9644503	\N	\N	\N	\N	Petrie Court Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
993	5618177645	40.736787	-73.9869081	\N	71	\N	Irving Place	Irving Farm Coffee Roasters	+1-212-995-5252	\N	10003	\N	\N	\N	\N	\N	\N
994	5620571662	40.6763251	-73.9840522	\N	\N	\N	\N	Root Hill Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
995	5625462945	40.7068582	-73.9223165	\N	420	\N	Troutman Street	AP Cafe	+1-347-404-6147	\N	\N	\N	\N	\N	\N	\N	\N
996	5625774814	40.6808478	-73.9756775	\N	\N	\N	\N	Joe Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
997	5627868643	40.7039682	-73.9190111	\N	104	\N	Wyckoff Avenue	VEX El Cafe	+1-646-683-8951	\N	\N	\N	\N	\N	\N	\N	\N
998	5629115420	40.6885416	-73.9168727	\N	1178	\N	Bushwick Avenue	House Party	\N	\N	\N	\N	\N	\N	\N	\N	\N
999	5634165227	40.7118521	-73.919257	\N	18-66	\N	Flushing Avenue	In Between Cafe	+1-718-768-7656	\N	\N	\N	\N	\N	\N	\N	\N
1000	5640736950	40.7355345	-73.9797733	\N	357	\N	1st Avenue	Tal Bagels	+1 212-753-9080	\N	10010	\N	\N	\N	\N	\N	\N
1001	5640741631	40.777498	-73.9503988	\N	333	\N	East 86th Street	Tal Bagels	+1-917-999-0371	\N	10028	\N	\N	\N	\N	\N	\N
1002	5640748792	40.7744439	-73.9544897	\N	1551	\N	2nd Avenue	H&H Midtown Bagels East	+1-212-734-7441	\N	10028	\N	\N	\N	\N	\N	\N
1003	5640753251	40.7861849	-73.9726071	\N	526	\N	Columbus Avenue	H&H Midtown Bagels East	+1-212-498-9828	\N	10024	\N	\N	\N	\N	\N	\N
1004	5642382126	40.7257638	-74.0011009	\N	152	\N	Prince Street	Chobani SoHo	+1-212-364-3970	\N	\N	\N	\N	\N	\N	\N	\N
1005	5656772688	40.6713031	-73.9847339	\N	\N	\N	\N	Maison de Viennoiserie	\N	\N	\N	\N	\N	\N	\N	\N	\N
1006	5656966142	40.6163585	-73.9927771	\N	6917	\N	18th Avenue	Caffe Italia	+1-347-554-8899	\N	11204	\N	\N	\N	\N	\N	\N
1007	5664788646	40.7542367	-73.9889033	New York	200	\N	West 39th Street	Café Grumpy	+1 646-449-8747	\N	10018	\N	\N	\N	\N	\N	\N
1008	5664801941	40.720511	-73.9960362	New York	177	\N	Mott Street	Café Grumpy	+1 212-226-6810	\N	10012	\N	\N	\N	\N	\N	\N
1009	5664814202	40.7521444	-73.9757163	New York	89	\N	East 42nd Street	Café Grumpy	+1 212-661-2198	\N	10017	\N	\N	\N	\N	\N	\N
1010	5669779496	40.7778553	-73.9782475	\N	273	\N	Columbus Avenue	Zucker''s Bagels & Smoked Fish	+1 212-874-2800	\N	10023	\N	\N	\N	\N	\N	\N
1011	5672782246	40.7874897	-73.953786	\N	1389	\N	Madison Avenue	Champignon Café	+1 212-987-1700	\N	10029	catering@champignoncafe.com	\N	\N	\N	\N	\N
1012	5672860212	40.7876673	-73.954025	\N	1392	\N	Madison Avenue	Da Capo Aperitivo e Caffe	+1 646-707-0684	\N	10029	\N	\N	\N	\N	\N	\N
1013	5686408267	40.7575483	-73.9269653	\N	34-56	\N	35th Avenue	Coffee Ave	\N	\N	\N	\N	\N	\N	\N	\N	\N
1014	5693951191	40.6849632	-73.9138237	Brooklyn	1643	NY	Broadway	Covert	\N	\N	11207	\N	\N	\N	\N	\N	\N
1015	5695227262	40.6757661	-73.9743815	\N	57	\N	7th Avenue	The Bagel Pub	\N	\N	11217	\N	\N	\N	\N	\N	\N
1016	5700532141	40.6792678	-73.9956991	\N	\N	\N	\N	Nili	+1-929-295-0606	\N	\N	\N	\N	\N	\N	\N	\N
1017	5703248590	40.6776961	-73.9726111	Brooklyn	\N	NY	Flatbush Avenue	Blank Street Coffee	\N	\N	11217	\N	\N	\N	\N	\N	\N
1018	5703390137	40.6696923	-73.9794371	Brooklyn	240	NY	7th Avenue	Poetica Coffee	\N	\N	11215	\N	\N	\N	\N	\N	\N
1019	5709144091	40.8690737	-73.9158442	\N	501	\N	West 214th Street	Cafe Tabaco and Ron	+1-212-567-7179	\N	\N	reservations@cafetabacoyron.nyc	\N	\N	\N	\N	\N
1020	5709672352	40.8693627	-73.9155908	\N	4026	\N	10th Avenue	Sahara Cafe	+1-646-882-0169	\N	\N	\N	\N	\N	\N	\N	\N
1021	5709999337	40.7717619	-73.9238515	\N	23-09	\N	Astoria Boulevard	Infinitea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1022	5711108963	40.764795	-73.9233644	\N	30-92	\N	31st Street	Under Pressure Espresso Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1023	5711111191	40.752547	-73.9094196	Woodside	51-06	NY	Northern Boulevard	Starbucks	+1 718-424-3716	\N	11377	\N	\N	\N	\N	\N	\N
1024	5711735763	40.8657529	-73.9272044	New York	4761	NY	Broadway	Starbucks	+1 212-304-3632	\N	10034	\N	\N	\N	\N	\N	\N
1025	5714335354	40.6778021	-73.969018	\N	620	\N	Vanderbilt Avenue	Milk Bar	+1-718-230-0844	\N	11238	\N	\N	\N	\N	\N	\N
1026	5715379617	40.6839299	-73.9172262	\N	83	\N	Saratoga Avenue	September	+1-347-221-0295	\N	\N	\N	\N	\N	\N	\N	\N
1027	5716101714	40.70593	-73.9365884	\N	279	\N	McKibben Street	Blue Bottle Coffee	+1-510-653-3394	\N	11206	\N	\N	\N	\N	\N	\N
1028	5716116193	40.7523028	-73.9784305	\N	60	\N	East 42nd Street	Blue Bottle Coffee	\N	\N	10165	\N	\N	\N	\N	\N	\N
1029	5721471863	40.7436528	-73.9203646	\N	44-01	\N	Queens Boulevard	Chakra Cafe	+1 929-462-0051	\N	\N	\N	\N	\N	\N	\N	\N
1030	5723870934	40.6922146	-73.914522	\N	447	\N	Central Avenue	Caffeine Underground	+1-718-484-4806	\N	\N	tcunyc@gmail.com	\N	\N	\N	\N	\N
1031	5723954896	40.6925908	-73.91525	\N	429	\N	Central Avenue	Aquino''s	+1-718-574-5207	\N	\N	\N	\N	\N	\N	\N	\N
1032	5725918582	40.7106548	-74.0121277	New York	150	NY	Greenwich Street	Blue Bottle Coffee	\N	\N	10007	\N	\N	\N	\N	\N	\N
1033	5725985607	40.7169605	-73.9610201	\N	76	\N	North 4th Street	Blue Bottle Coffee	\N	\N	11249	\N	\N	\N	\N	\N	\N
1034	5726008201	40.7340565	-73.9924563	\N	101	\N	University Place	Blue Bottle Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
1035	5726345621	40.7596136	-73.9754488	\N	10	\N	East 53rd Street	Blue Bottle Coffee	\N	\N	10022	\N	\N	\N	\N	\N	\N
1036	5728801365	40.6475474	-74.0003504	\N	4017	\N	7th Avenue	Sun House Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1037	5729339305	40.7795258	-73.9507703	\N	1707	\N	2nd Avenue	JJ Brown Cup	+1 212-369-3949	\N	10128	\N	\N	\N	\N	\N	\N
1038	5732810775	40.6994635	-73.9300282	Brooklyn	109	NY	Troutman Street	Ambrosia Elixirs	+1-347-365-3662	\N	11221	\N	\N	\N	\N	\N	\N
1039	5734944621	40.7452186	-73.9902413	\N	49	\N	West 27th Street	Patent Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1040	5735248331	40.7050509	-73.928984	\N	119	\N	Knickerbocker Avenue	Crossroads Cafe	+1-347-422-0969	\N	\N	\N	\N	\N	\N	\N	\N
1041	5739490440	40.7033905	-73.9301425	\N	17	\N	Wilson Avenue	Your Way Cafe	+1-347-745-8605	\N	\N	\N	\N	\N	\N	\N	\N
1042	5747108148	40.6428261	-73.9797361	\N	97	\N	Church Avenue	Kabir''s Bakery	+1-718-853-7907	\N	11218	\N	\N	\N	\N	\N	\N
1043	5747283270	40.6353281	-73.9788437	Brooklyn	2	NY	Ditmas Avenue	Corner Cafe	\N	\N	11218	\N	\N	\N	\N	\N	\N
1044	5747406152	40.7475924	-73.9415538	\N	26-25	\N	Jackson Avenue	Partners Coffee	+1 347-531-0477	\N	\N	\N	\N	\N	\N	\N	\N
1045	5747519893	40.695591	-73.9089131	\N	462	\N	Irving Avenue	Saint Michel	\N	\N	\N	\N	\N	\N	\N	\N	\N
1046	5751854223	40.7041849	-73.9341582	\N	247	\N	Varet Street	Ange Noir Cafe	+1-718-366-1520	\N	\N	\N	\N	\N	\N	\N	\N
1047	5754840626	40.7593056	-73.9921933	\N	607	\N	9th Avenue	ViVi Bubble Tea	+1 212-956-0288	\N	10036	\N	\N	\N	\N	\N	\N
1048	5756089925	40.7189834	-74.0009997	\N	\N	\N	\N	Dreamers Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1049	5757237337	40.7376051	-73.9875777	New York	103	NY	East 19th Street	Daily Provisions	+1-646-503-4440	\N	10003	\N	\N	\N	\N	\N	\N
1050	5758465202	40.6901694	-73.9069855	\N	611A	\N	Wilson Avenue	Father Knows Best	\N	\N	\N	\N	\N	\N	\N	\N	\N
1051	5759472203	40.7139319	-73.9204123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1052	5759612785	40.7518535	-73.9733935	\N	685	\N	3rd Avenue	Le Pain Quotidien	\N	\N	10017	\N	\N	\N	\N	\N	\N
1053	5760798327	40.7593131	-73.7684395	Bayside	45-43B	NY	Bell Boulevard	Pate	+1-347-235-0045	\N	11361	\N	\N	\N	\N	\N	\N
1054	5763535285	40.7456218	-73.9041444	\N	60-07	\N	Roosevelt Avenue	Go Go Bubble Tea	+1-929-614-5721	\N	\N	\N	\N	\N	\N	\N	\N
1055	5763904853	40.7689891	-73.9356112	\N	31-01	\N	Vernon Boulevard	Chateau le Woof	\N	\N	11106	\N	\N	\N	\N	\N	\N
1056	5771831853	40.7524881	-73.9880033	\N	\N	\N	\N	Bluestone Lane	\N	\N	\N	\N	\N	\N	\N	\N	\N
1057	5775345819	40.6649151	-73.98342	\N	396	\N	7th Avenue	Lively	\N	\N	11215	\N	\N	\N	\N	\N	\N
1058	5775345828	40.6653857	-73.9830381	\N	384	\N	7th Avenue	Naidre''s	+1-718-965-7585	\N	11215	\N	\N	\N	\N	\N	\N
1059	5782495654	40.7882751	-73.9490068	\N	1565	\N	Lexington Avenue	MY NY Bakery Cafe	+1 212-722-7383	\N	10029	\N	\N	\N	\N	\N	\N
1060	5782496201	40.7945777	-73.9337278	\N	283	\N	Pleasant Avenue	Love Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1061	5782951777	40.6844405	-73.9788828	Brooklyn	572	NY	Atlantic Avenue	Squarrel Cafe	+1-718-237-4286	\N	11217	\N	\N	\N	\N	\N	\N
1062	5788137439	40.7266858	-73.9959215	\N	643	\N	Broadway	CoCo Fresh Tea & Juice	+1-212-614-3170	\N	\N	info@everyday-hospitality.com	\N	\N	\N	\N	\N
1063	5788273495	40.726876	-73.995752	\N	649	\N	Broadway	Gregory''s Coffee	+1-646-478-7258	\N	10012	\N	\N	\N	\N	\N	\N
1064	5792264308	40.726208	-73.9954844	\N	68	\N	Bleecker Street	Cafe Angelique	+1-212-475-3500	\N	\N	info@cafeangeliquenyc.com	\N	\N	\N	\N	\N
1065	5792284140	40.7275742	-73.993705	\N	380	\N	Lafayette	Lafayette Grand Café & Bakery	+1-212-533-3000	\N	\N	info@lafayetteny.com	\N	\N	\N	\N	\N
1066	5793095927	40.7634155	-73.9654893	\N	\N	\N	\N	Upper East Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
1067	5793887409	40.5992009	-73.9517722	\N	1924	\N	Avenue U	Golden Sands Cafe Inc.	\N	\N	\N	\N	\N	\N	\N	\N	\N
1068	5794634047	40.6820717	-73.9932357	\N	372	\N	Sackett Street	Cotton Bean	\N	\N	11231	\N	\N	\N	\N	\N	\N
1069	5794664401	40.6828547	-73.9952495	\N	314	\N	Sackett Street	Nerd Be Cool	\N	\N	11231	\N	\N	\N	\N	\N	\N
1070	5794694809	40.6833392	-73.9996341	\N	\N	\N	\N	Mazzola Bakery	+1-718-643-1719	\N	\N	\N	\N	\N	\N	\N	\N
1071	5796438080	40.7257887	-74.0011724	\N	154	\N	Prince Street	La Colombe Coffee Roasters	+1-646-690-7340	\N	\N	help@lacolombe.net	\N	\N	\N	\N	\N
1072	5797335696	40.6919532	-73.986422	\N	\N	\N	\N	Möge Tee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1073	5797455000	40.6771044	-73.9829762	Brooklyn	225	NY	4th Avenue	Starbucks	+1 347-909-1507	\N	11215	\N	\N	\N	\N	\N	\N
1074	5799024753	40.7163524	-73.9981687	\N	\N	\N	\N	Ten Ren	\N	\N	\N	\N	\N	\N	\N	\N	\N
1075	5801942482	40.7032509	-73.9328762	\N	995	\N	Flushing Avenue	Bake Shop	+1-718-381-3706	\N	\N	\N	\N	\N	\N	\N	\N
1076	5805217646	40.6691904	-73.9859437	Brooklyn	313	NY	9th Street	Gong Cha	+1-347-294-0496	\N	11215	\N	\N	\N	\N	\N	\N
1077	5806583254	40.7512755	-73.9793045	\N	33	\N	east 40th street	Taylor St. Baristas	\N	\N	\N	\N	\N	\N	\N	\N	\N
1078	5811536127	40.8440279	-73.7854627	\N	205	\N	City Island Avenue	Ray''s Cafe	+1-347-346-9119	\N	\N	\N	\N	\N	\N	\N	\N
1079	5812464935	40.7521357	-73.9915345	\N	234	\N	West 35th Street	Madman Espresso	\N	\N	10001	info@madmanespresso.com	\N	\N	\N	\N	\N
1080	5817720353	40.7793161	-73.9808861	New York	279	NY	Amsterdam Avenue	Blue Bottle Coffee	\N	\N	10023	\N	\N	\N	\N	\N	\N
1081	5818421646	40.7560886	-73.9926331	\N	333	\N	West 39th Street	Aleef Coffee House Inc	+1-212-7564-2723	\N	\N	\N	\N	\N	\N	\N	\N
1082	5819051479	40.6670686	-73.9812452	\N	321	\N	7th Avenue	Cusp	+1-718-788-2980	\N	11215	\N	\N	\N	\N	\N	\N
1083	5821317603	40.6634448	-73.991455	Brooklyn	620	NY	5th Avenue	Yardsale Cafe	+1-929-477-0167	\N	11215	\N	\N	\N	\N	\N	\N
1084	5821349507	40.6672789	-73.9808256	Brooklyn	414	NY	8th Street	Java Joe	+1-718-369-6026	\N	11215	\N	\N	\N	\N	\N	\N
1085	5823823343	40.7052284	-73.9444215	\N	84	\N	Manhattan Avenue	19 Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1086	5827853291	40.668131	-73.9869618	\N	\N	\N	\N	Sip & Play	+1-718-971-1684	\N	\N	\N	\N	\N	\N	\N	\N
1087	5836577592	40.7793832	-73.9829974	\N	\N	\N	\N	Tea Magic	+1-212-712-2227	\N	\N	\N	\N	\N	\N	\N	\N
1088	5837218439	40.7515815	-74.0053292	New York	601	NY	West 27th Street	La Colombe Coffee Roasters	+1 (646) 885-0677	\N	10001	\N	\N	\N	\N	\N	\N
1089	5840570545	40.6166822	-74.0310713	\N	9402	\N	4th Avenue	Pasticceria Rocco	+1 718-745-2590	\N	11209	\N	\N	\N	\N	\N	\N
1090	5842396231	40.6648362	-73.9937781	\N	618	\N	4th Avenue	Bread & Joe	\N	\N	11215	\N	\N	\N	\N	\N	\N
1091	5844657601	40.6199411	-74.0326909	\N	9102	\N	3rd Avenue	Little Cupcake Bakeshop	+1-718-680-4465	\N	11209	\N	\N	\N	\N	\N	\N
1092	5849787600	40.7291067	-73.9839653	\N	176	\N	1st Avenue	Black Seed Bagels	+1 646-484-5781	\N	10009	\N	\N	\N	\N	\N	\N
1093	5849801770	40.7456636	-73.9884874	\N	1188	\N	Broadway	Black Seed Bagels	\N	\N	10001	\N	\N	\N	\N	\N	\N
1094	5849929497	40.7296485	-73.9988026	\N	78	\N	West 3rd Street	Irving Farm Coffee Roasters	+1-646-398-7146	\N	\N	holler@irvingfarm.com	\N	\N	\N	\N	\N
1526	8265056191	40.6678048	-73.9806236	Brooklyn	\N	NY	\N	Brew Memories	\N	\N	\N	\N	\N	\N	\N	\N	\N
1095	5852314821	40.8055083	-73.9653737	New York	2882	NY	Broadway	Oren''s Daily Roast	+1 212-749-8779	\N	10025	\N	\N	\N	\N	\N	\N
1096	5852364693	40.7718742	-73.9563636	\N	1475	\N	2nd Avenue	Pick-A-Bagel	+1 212-717-4668	\N	10075	\N	\N	\N	\N	\N	\N
1097	5852378587	40.6819521	-73.995929	\N	\N	\N	\N	Monteleone''s Bakery & Cafe	+1-718-852-5600	\N	\N	\N	\N	\N	\N	\N	\N
1098	5853859976	40.6127415	-74.000354	\N	7815	\N	17th Avenue	Mochick Tea	+1 347-254-6486	\N	11214	\N	\N	\N	\N	\N	\N
1099	5856029899	40.7478787	-73.9763222	\N	569	\N	3rd Avenue	Daniel''s Bagels	+1 212-972-9733	\N	10016	\N	\N	\N	\N	\N	\N
1100	5859542351	40.6758276	-73.9838715	\N	\N	\N	\N	Whisk & Whiskey	+1-347-799-1639	\N	\N	\N	\N	\N	\N	\N	\N
1101	5859940717	40.7720548	-73.9608314	\N	1045	\N	Lexington Avenue	Joe Coffee Company	+1 212-988-2500	\N	10021	\N	\N	\N	\N	\N	\N
1102	5862744811	40.7750206	-73.9803155	\N	187	\N	Columbus Avenue	Joe Coffee Company	+1 212-877-0244	\N	10023	\N	\N	\N	\N	\N	\N
1103	5868596706	40.7803846	-73.9533857	New York	171	NY	East 88th Street	Birch Coffee	+1 212-646-1444	\N	10128	\N	\N	\N	\N	\N	\N
1104	5868658667	40.7807678	-73.9523027	\N	1585	\N	3rd Avenue	Bagels & More	+1 212-348-4395	\N	\N	\N	\N	\N	\N	\N	\N
1105	5872669068	40.5901126	-73.7973406	\N	\N	\N	\N	Cuisine By Claudette	\N	\N	\N	\N	\N	\N	\N	\N	\N
1106	5874439929	40.7027119	-73.907272	\N	709	\N	Seneca Avenue	Cafe M Seneca	+1-646-949-1811	\N	\N	\N	\N	\N	\N	\N	\N
1107	5876444850	40.7465581	-73.9814145	New York	3	NY	Park Avenue	Le Pain Quotidien	+1-212-779-2905	\N	10016	\N	\N	\N	\N	\N	\N
1108	5876977173	40.7922821	-73.9406837	New York	308	NY	East 109th Street	Dear Mama Coffee	+1 929-279-2225	\N	\N	\N	\N	\N	\N	\N	\N
1109	5887438223	40.7258379	-73.7401745	Jamaica	90-49	NY	Springfield Boulevard	Hi Luck	+1 718 4652777	\N	11428	\N	\N	\N	\N	\N	\N
1110	5889547501	40.7270509	-73.9801128	\N	341	\N	East 10th Street	Ninth Street Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
1111	5891774859	40.6790596	-73.9681533	Brooklyn	609	NY	Vanderbilt Avenue	Gran Caffé de Martini	\N	\N	11238	\N	\N	\N	\N	\N	\N
1112	5893344796	40.6803422	-73.9693396	\N	\N	\N	\N	Sweetbee Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1113	5896851985	40.7273043	-74.0059691	New York	175	NY	Varick Street	Seven Grams Caffé	+19172617527	\N	10014	\N	\N	\N	\N	\N	\N
1114	5904850531	40.7146071	-73.9924298	\N	6	\N	Allen Street	Happy Express Cafe, Inc.	+1-212-965-9898	\N	\N	\N	\N	\N	\N	\N	\N
1115	5905798195	40.6351311	-74.0235244	\N	\N	\N	\N	City League	\N	\N	\N	\N	\N	\N	\N	\N	\N
1116	5906764089	40.751312	-73.9401037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1117	5906840087	40.7554977	-73.9412472	\N	\N	\N	\N	Oh! Bagels	\N	\N	\N	\N	\N	\N	\N	\N	\N
1118	5906974191	40.6508022	-73.7915347	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
1119	5906982488	40.6471223	-73.7910249	\N	\N	\N	\N	Euro Crepe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1120	5906982490	40.6471704	-73.7911643	Jamaica	\N	NY	\N	Starbucks	+1 718-553-2151	\N	11430	\N	\N	\N	\N	\N	\N
1121	5908861465	40.6644147	-73.9838344	\N	\N	\N	\N	Techne Kafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1122	5910319476	40.6616051	-73.9857929	\N	\N	\N	\N	Cafe on 7th	+1-347-235-7158	\N	\N	\N	\N	\N	\N	\N	\N
1123	5910319479	40.6617344	-73.9856885	\N	\N	\N	\N	Little Honey	+1-917-909-1609	\N	\N	\N	\N	\N	\N	\N	\N
1124	5912873399	40.6871827	-73.9937419	\N	\N	\N	\N	Joy	\N	\N	\N	\N	\N	\N	\N	\N	\N
1125	5912968131	40.6905679	-73.9917738	\N	113	\N	Court Street	ViVi Bubble Tea	+1 718-522-3091	\N	11201	\N	\N	\N	\N	\N	\N
1126	5912968134	40.6887231	-73.9930112	\N	\N	\N	\N	Mamman	\N	\N	\N	\N	\N	\N	\N	\N	\N
1127	5914043148	40.6647746	-73.9864585	\N	535	\N	6th Avenue	OS Cafe	+1-347-213-4365	\N	11215	\N	\N	\N	\N	\N	\N
1128	5924114805	40.8066955	-73.9638287	\N	\N	\N	\N	Café East	\N	\N	\N	\N	\N	\N	\N	\N	\N
1129	5924114807	40.8067796	-73.9637662	\N	\N	\N	\N	Blue Java	\N	\N	\N	\N	\N	\N	\N	\N	\N
1130	5924114808	40.8065269	-73.9631276	\N	\N	\N	\N	Blue Java	\N	\N	\N	\N	\N	\N	\N	\N	\N
1131	5925003683	40.8071136	-73.9649082	New York	2929	NY	Broadway	Starbucks	+1 212-932-0300	\N	10025	\N	\N	\N	\N	\N	\N
1132	5932754534	40.7792964	-73.9533764	New York	1535	NY	3rd Avenue	Le Pain Quotidien	+1 332-910-6856	\N	10028	\N	\N	\N	\N	\N	\N
1133	5934793658	40.7040845	-73.901837	Ridgewood	67-14	NY	Forest Avenue	Nomad Cafe and Eatery	+1-347-227-8136	\N	11385	\N	\N	\N	\N	\N	\N
1134	5937436932	40.6707067	-73.9862615	\N	\N	\N	\N	Cafe Nanahoshi	\N	8	\N	\N	\N	\N	\N	\N	\N
1135	5937855588	40.7049901	-73.9234506	Brooklyn	207	NY	Starr Street	Pitanga	+1-718-456-1048	\N	\N	\N	\N	\N	\N	\N	\N
1136	5939562687	40.7761994	-73.9815882	\N	143	\N	West 69th Street	Noi Due Cafe	+1-212-712-2222	\N	\N	\N	\N	\N	\N	\N	\N
1137	5941202236	40.6559297	-74.0030444	\N	\N	\N	\N	Mama Lupita''s Bistro	+1-917-909-0522	\N	\N	\N	\N	\N	\N	\N	\N
1138	5949200228	40.6937046	-73.9646875	\N	\N	\N	\N	Petee''s Cafe	+1-646-494-3630	\N	\N	\N	\N	\N	\N	\N	\N
1139	5955392985	40.7027759	-74.012773	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
1140	5963034386	40.7162589	-73.9554176	Brooklyn	88	NY	Roebling Street	7 Grain Army	\N	\N	11211	\N	\N	\N	\N	\N	\N
1141	5978556693	40.7715971	-73.9611763	\N	1031	\N	Lexington Avenue	Colomba Coffee	\N	\N	10021	\N	\N	\N	\N	\N	\N
1142	5978556700	40.7035005	-74.0129805	\N	27	\N	Whitehall Street	Flavors	\N	\N	\N	\N	\N	\N	\N	\N	\N
1143	5978556705	40.7061538	-74.0128132	\N	42	\N	Broadway	Gregory’s Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1144	5978556714	40.711896	-74.0005122	\N	5	\N	Madison Street	Madison Bagel & Grill	\N	\N	\N	\N	\N	\N	\N	\N	\N
1145	5978556721	40.707216	-74.008596	\N	62	\N	William Street	Koyzina Kafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1146	5978556725	40.7090861	-74.0070176	\N	\N	\N	\N	Open Kitchen	\N	\N	\N	\N	\N	\N	\N	\N	\N
1147	5978556732	40.711246	-74.0063142	New York	140	NY	Nassau Street	Variety Coffee	+1-212-267-0207	\N	10038	\N	\N	\N	\N	\N	\N
1148	5978556769	40.7223584	-73.9501246	\N	\N	\N	Manhattan Avenue	Cotter Barber	\N	\N	\N	\N	\N	\N	\N	\N	\N
1149	5978556770	40.7230585	-73.9502459	\N	\N	\N	\N	Charlotte Patisserie	\N	\N	\N	\N	\N	\N	\N	\N	\N
1150	5978556807	40.7102157	-74.0057019	New York	166	\N	William Street	Dante’s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	5978557687	40.7093091	-74.0068103	\N	\N	\N	\N	BentOn Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1152	5978557997	40.7095297	-74.0119738	\N	110	\N	Trinity Place	Lazzaro	\N	\N	\N	\N	\N	\N	\N	\N	\N
1153	5978557998	40.7094109	-74.0120305	\N	110	\N	Trinity Place	Hank’s Pizza	+12127964499	\N	\N	\N	\N	\N	\N	\N	\N
1154	5978558001	40.7083708	-74.0074301	New York	100	NY	William Street	Starbucks	+1 212-509-9709	\N	10038	\N	\N	\N	\N	\N	\N
1155	5978558008	40.7070318	-74.0080353	\N	25	\N	Cedar Street	Pita Press	\N	\N	\N	\N	\N	\N	\N	\N	\N
1156	5978558886	40.7082492	-74.0101892	\N	\N	\N	\N	Manon Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1157	5978792116	40.7073322	-74.0059333	\N	225	\N	Pearl Street	Sons of Thunder	+1-646-822-0208	\N	\N	\N	\N	\N	\N	\N	\N
1158	5978792487	40.6867938	-73.9662119	Brooklyn	147	NY	Greene Avenue	Prim Rose Café	\N	\N	11238	\N	\N	\N	\N	\N	\N
1159	5978795488	40.7443569	-73.9125569	\N	51-29	\N	43rd Avenue	Café 52	+1 718-424-0250	\N	\N	\N	\N	\N	\N	\N	\N
1160	5978832686	40.7444812	-73.9125355	\N	41-54	\N	52nd Street	Ju-Go Juice Bar	+1 718-440-9135	\N	\N	\N	\N	\N	\N	\N	\N
1161	5978837386	40.7234561	-73.9514323	Brooklyn	66	NY	Nassau Avenue	Starbucks	+1 718-383-3750	\N	11222	\N	\N	\N	\N	\N	\N
1162	5981998923	40.669662	-73.9868921	\N	287	\N	9th Street	Bagel Pub	\N	\N	11215	\N	\N	\N	\N	\N	\N
1163	5983989122	40.7113076	-74.016162	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
1164	5984058502	40.8442897	-73.9424117	\N	83	\N	Haven Avenue	Hilltop Perk	\N	\N	\N	\N	\N	\N	\N	\N	\N
1165	5985763486	40.758148	-73.9824848	\N	1185	\N	6th Avenue	Starbucks	2127307645	\N	10036	\N	\N	\N	\N	\N	\N
1166	5985838985	40.7596521	-73.9852254	New York	1585	NY	Broadway	Starbucks	+1 212-541-7515	\N	10036	\N	\N	\N	\N	\N	\N
1167	5987486741	40.6831965	-73.9927143	\N	\N	\N	\N	Poetica Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1168	5990907363	40.7582209	-73.8296914	\N	40-52	\N	Main Street	Xing Fu Tang	+1 929-519-6206	\N	\N	\N	\N	\N	\N	\N	\N
1171	6004765085	40.7088941	-73.9360587	\N	297	\N	Meserole Street	City of Saints Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	6006148886	40.6875229	-73.9237864	\N	\N	\N	\N	Chez Alex	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	6006276987	40.7202527	-73.9983375	\N	239	\N	Centre Street	Maman	+1 212-226-0700	\N	\N	\N	\N	\N	\N	\N	\N
1174	6006276988	40.7433245	-73.9901642	\N	\N	\N	\N	Maman	\N	\N	\N	\N	\N	\N	\N	\N	\N
1175	6006289990	40.7343048	-73.9575298	\N	\N	\N	\N	Bakeri	+1-718-349-1542	\N	\N	\N	\N	\N	\N	\N	\N
1176	6006320286	40.7544586	-73.9764655	\N	81	\N	East 45th Street	Partners Coffee	+1 646-747-0801	\N	\N	\N	\N	\N	\N	\N	\N
1177	6006336588	40.688819	-73.9551884	\N	1058	\N	Bedford Avenue	Stonefruit	\N	\N	\N	\N	\N	\N	\N	\N	\N
1178	6008609702	40.6618916	-73.9819584	\N	428	\N	15th Street	Cuppa Hive Coffee	\N	\N	11215	\N	\N	\N	\N	\N	\N
1179	6008970685	40.7606732	-73.985793	\N	\N	\N	\N	Masseria Caffe & Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
1180	6008979885	40.7589838	-73.9901759	\N	\N	\N	\N	St Kilda Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1181	6026088130	40.7430002	-73.9966979	New York	188	NY	7th Avenue	Matto Espresso	\N	\N	10011	\N	\N	\N	\N	\N	\N
1182	6030389800	40.7572238	-73.9807255	New York	44	NY	West 47th Street	Robusta Espresso Bar	+1-212-302-0242	\N	10036	\N	\N	\N	\N	\N	\N
1183	6037257725	40.7183082	-73.9573908	\N	166	\N	Bedford Avenue	Vittoria	718-388-3118	\N	\N	\N	\N	\N	\N	\N	\N
1184	6037820263	40.66171	-73.9892569	\N	\N	\N	\N	Mexique Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1185	6044339377	40.7186713	-74.0005149	\N	120C	\N	Lafayette Street	Kaigo Coffee Room	+1-646-504-5353	\N	10013	\N	\N	\N	\N	\N	\N
1186	6053555793	40.7294715	-73.9844822	\N	342	\N	East 11th Street	Veniero''s Pasticcera & Caffé	+1-212-674-7070	\N	10003	\N	\N	\N	\N	\N	\N
1187	6055272196	40.7913646	-73.9513622	\N	1490	\N	Madison Avenue	Superior Café	+1 646-666-0095	\N	10029	\N	\N	\N	\N	\N	\N
1188	6057926785	40.6870195	-73.9901147	\N	\N	\N	\N	Mia''s Bakery	+1-347-987-3194	\N	11201	\N	\N	\N	\N	\N	\N
1189	6067214134	40.7541518	-73.9861387	\N	1440	\N	Broadway	Le Café Coffee	+1 212-768-3602	\N	\N	\N	\N	\N	\N	\N	\N
1190	6068979466	40.7603546	-73.9611323	New York	1102	NY	1st Avenue	Starbucks	+1 212-618-9118	\N	10065	\N	\N	\N	\N	\N	\N
1191	6071485490	40.7681491	-73.9853167	New York	884	NY	9th Avenue	Birch Coffee	+1-212-686-1444	\N	10019	57thstreet@birchcoffee.com	\N	\N	\N	\N	\N
1192	6071606246	40.6628451	-73.991657	\N	639	\N	5th Avenue	Roots Cafe	+1-929-301-5535	\N	11215	\N	\N	\N	\N	\N	\N
1193	6073872634	40.7131587	-73.9087002	\N	55-03	\N	Metropolitan Avenue	Sebastian''s Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1194	6074315900	40.7108654	-74.0059234	New York	8	\N	Spruce Street	Birch Coffee	+1 212-686-1444	\N	10038	8sprucest@birchcoffee.com	\N	\N	\N	\N	\N
1195	6088775969	40.6760534	-73.963613	\N	\N	\N	\N	Penny House Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1196	6090813612	40.6647385	-73.9898041	\N	\N	\N	\N	Le French Tart	\N	\N	\N	\N	\N	\N	\N	\N	\N
1197	6104250725	40.7535315	-73.9874051	\N	1407	\N	Broadway	Heytea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1198	6109932937	40.7378288	-74.0047228	\N	19	\N	8th Avenue	Rebel Coffee	+1-917-261-4299	\N	\N	\N	\N	\N	\N	\N	\N
1199	6110870385	40.7153768	-73.9980301	New York	63	NY	Bayard Street	Mango Mango	+1-646-982-7421	\N	10013	\N	\N	\N	\N	\N	\N
1200	6110907588	40.7291946	-73.9886324	\N	23	\N	Saint Marks Place	Mango Mango Dessert	\N	\N	10003	\N	\N	\N	\N	\N	\N
1201	6110940186	40.7191116	-73.9963326	\N	206	\N	Grand Street	Yaya Tea Garden	2129292832	\N	\N	\N	\N	\N	\N	\N	\N
1202	6121661568	40.6881861	-73.9876169	\N	\N	\N	\N	Absolute Coffee	+1-718-522-0969	\N	\N	\N	\N	\N	\N	\N	\N
1203	6124372218	40.7632811	-73.9939987	\N	515	\N	West 47th Street	Jolly Goat Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1204	6125305149	40.7003011	-73.9293438	\N	108	\N	Central Avenue	Cafe Moca	\N	\N	\N	\N	\N	\N	\N	\N	\N
1205	6127296735	40.6998856	-73.9280748	\N	127	\N	Central Avenue	Bushwick Bakery	+1-917-460-5994	\N	11221	bulldogcakes@yahoo.com	\N	\N	\N	\N	\N
1206	6128749086	40.6981662	-73.9210076	\N	251	\N	Wilson Avenue	IC Brooklyn Cafe	+1-718-450-3346	\N	\N	\N	\N	\N	\N	\N	\N
1207	6133822485	40.7566505	-73.9841404	\N	\N	\N	\N	cafe un deux trois	\N	\N	\N	\N	\N	\N	\N	\N	\N
1208	6139560285	40.7435856	-74.0032089	\N	\N	\N	\N	Stone Street Coffee Company	\N	\N	\N	\N	\N	\N	\N	\N	\N
1209	6154104345	40.6729622	-73.9626595	\N	\N	\N	\N	Earth Shine	\N	\N	\N	\N	\N	\N	\N	\N	\N
1210	6171881585	40.6840022	-73.9993095	\N	\N	\N	\N	Brooklyn Farmacy & Soda Fountain	+1-718-522-6260	\N	\N	\N	\N	\N	\N	\N	\N
1211	6174373286	40.7224336	-74.0034695	\N	\N	\N	\N	Sanctuary T	\N	\N	\N	\N	\N	\N	\N	\N	\N
1212	6175354948	40.6825942	-73.9632502	Brooklyn	936	NY	Fulton Street	The Good Batch	\N	\N	11238	\N	\N	\N	\N	\N	\N
1213	6177508886	40.6503575	-74.0050741	\N	4022	\N	5th Avenue	Judy’s	+1-929-337-6252	\N	11232	\N	\N	\N	\N	\N	\N
1214	6178688685	40.6424359	-74.0025366	\N	\N	\N	\N	Thaï tea milk spot	\N	\N	\N	\N	\N	\N	\N	\N	\N
1215	6179821278	40.7099202	-74.0091218	\N	12	\N	John Street	CoCo Fresh Tea & Juice	+1-212-349-1800	\N	10038	\N	\N	\N	\N	\N	\N
1216	6184702285	40.6566731	-74.0077764	\N	\N	\N	\N	Colson Pâtisserie	\N	\N	\N	\N	\N	\N	\N	\N	\N
1217	6187464284	40.766411	-73.991661	\N	515	\N	West 52nd Street	La Bergamote	+1 212-586-2429	\N	\N	\N	\N	\N	\N	\N	\N
1218	6188784951	40.6815369	-73.9558972	\N	\N	\N	\N	Golda	+1-718-484-7065	\N	\N	\N	\N	\N	\N	\N	\N
1219	6190098843	40.6978902	-73.9371547	\N	\N	\N	\N	Café Erzulie	\N	\N	\N	\N	\N	\N	\N	\N	\N
1220	6201492297	40.7627635	-73.9779699	New York	1350	NY	6th Avenue	Joe & The Juice	\N	\N	10019	\N	\N	\N	\N	\N	\N
1221	6201867798	40.6410569	-73.7825643	\N	\N	\N	\N	Peet''s Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1222	6206584785	40.7278638	-74.001067	New York	169	NY	Sullivan Street	Banter	\N	\N	10012	\N	\N	\N	\N	\N	\N
1223	6206712391	40.7928702	-73.9410205	\N	2127	\N	2nd Avenue	Raspberry Deli & Grocery	+1 212-860-2615	\N	\N	\N	\N	\N	\N	\N	\N
1224	6208859175	40.7629454	-73.8307646	\N	137-06	\N	Northern Boulevard	Sweet Cake	\N	\N	\N	\N	\N	\N	\N	\N	\N
1225	6216930316	40.7635715	-73.9670304	\N	785	\N	Lexington Avenue	Pick a Bagel	\N	\N	\N	\N	\N	\N	\N	\N	\N
1226	6217348319	40.7657733	-73.9657807	\N	858	\N	Lexington Avenue	Panda Bubble Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1227	6218981269	40.71729	-73.9996503	\N	131	\N	Walker Street	Sweets Bakery	\N	\N	10013	\N	\N	\N	\N	\N	\N
1228	6221183785	40.7347592	-73.9925643	\N	\N	\N	\N	Nutella café	\N	\N	\N	\N	\N	\N	\N	\N	\N
1229	6228150877	40.748044	-73.9873353	\N	39	\N	West 32nd Street	caffé bene	+1 917-475-1432	\N	\N	\N	\N	\N	\N	\N	\N
1230	6230656614	40.7252668	-73.984294	\N	85	\N	Avenue A	Juicy Lucy	\N	\N	\N	\N	\N	\N	\N	\N	\N
1231	6231238816	40.7473548	-73.9862282	\N	6	\N	West 32nd Street	Paris Baguette	+1 212-244-0404	\N	10001	\N	\N	\N	\N	\N	\N
1232	6231491557	40.7119876	-73.9945141	New York	47	NY	Market Street	A2Z Dominican	(646) 462-3398	\N	10002	\N	\N	\N	\N	\N	\N
1233	6231514602	40.7138584	-73.990386	New York	155	NY	East Broadway	12 Corners	+1-212-625-8888	\N	10002	\N	\N	\N	\N	\N	\N
1234	6233803805	40.7197029	-73.9884286	New York	124	NY	Ludlow Street	Caffè Vita	(212) 260-8482	\N	10002	\N	\N	\N	\N	\N	\N
1235	6236054985	40.6848922	-73.9540394	\N	\N	\N	\N	Artshack cafe/bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1236	6236928056	40.7200481	-73.9902485	New York	129	NY	Allen Street	Joey Bats Café	(212) 519-2289	\N	10002	\N	\N	\N	\N	\N	\N
1237	6236943852	40.7208818	-73.9898439	New York	151	NY	Allen Street	Kabisera	(929) 920-8250	\N	10002	\N	\N	\N	\N	\N	\N
1238	6237945202	40.6722974	-73.9417546	\N	\N	\N	\N	Cocoa Grinder	\N	\N	\N	\N	\N	\N	\N	\N	\N
1239	6238292396	40.6735922	-73.9894442	\N	\N	\N	\N	By Clio	+1-516-636-6008	\N	\N	\N	\N	\N	\N	\N	\N
1240	6242155998	40.6660315	-73.9367904	\N	361	\N	Troy Avenue	Bunch o'' Bagels	+1-718-604-0634	\N	11213	\N	\N	\N	\N	\N	\N
1241	6244721154	40.765555	-73.9655855	New York	849	NY	Lexington Avenue	Hale and Hearty Soups	(212)517-7600	\N	10065	\N	\N	\N	\N	\N	\N
1242	6248588890	40.7146755	-73.9566512	Brooklyn	133	\N	Roebling Street	Oslo Coffee	\N	\N	11211	\N	\N	\N	\N	\N	\N
1243	6249163403	40.6738224	-73.7305469	\N	\N	\N	\N	Urban Gourmet	\N	\N	\N	\N	\N	\N	\N	\N	\N
1244	6250062022	40.7788421	-73.9558617	\N	1269	\N	Lexington Avenue	Variety Coffee Roasters	+1 212-289-2104	\N	10028	\N	\N	\N	\N	\N	\N
1245	6250176401	40.745206	-73.9946116	\N	261	\N	7th Avenue	Variety Coffee Roasters	+1 917-409-0106	\N	10001	\N	\N	\N	\N	\N	\N
1246	6259694363	40.7151944	-73.9975111	\N	49	\N	Bayard Street	ViVi Bubble Tea	+1 212-566-6833	\N	10013	\N	\N	\N	\N	\N	\N
1247	6259730842	40.7438479	-73.9954656	\N	170	\N	West 23rd Street	ViVi Bubble Tea	+1 212-366-0688	\N	10011	\N	\N	\N	\N	\N	\N
1248	6259767847	40.7474567	-73.9865203	\N	12	\N	West 32nd Street	Gong Cha	+1 646-998-4362	\N	10001	\N	\N	\N	\N	\N	\N
1249	6259787768	40.7156257	-73.9982259	\N	72	\N	Bayard Street	Gong Cha	+1 646-726-4940	\N	10013	\N	\N	\N	\N	\N	\N
1250	6260059211	40.7136566	-73.9974429	\N	2	\N	East Broadway	ViVi Bubble Tea	+1 212-966-5793	\N	10038	\N	\N	\N	\N	\N	\N
1251	6260102833	40.6356846	-74.0096259	\N	5924	\N	8th Avenue	ViVi Bubble Tea	+1 718-439-0288	\N	11220	\N	\N	\N	\N	\N	\N
1252	6260632696	40.7823302	-73.9811871	New York	2173	NY	Broadway	Mille-Feuille Bakery Cafe	\N	\N	10024	\N	\N	\N	\N	\N	\N
1253	6264476981	40.7105042	-74.0091441	\N	200	\N	Fulton Street	Gong Cha	\N	\N	10038	\N	\N	\N	\N	\N	\N
1254	6270644226	40.7906349	-73.9519553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1255	6270649485	40.7871321	-73.9544023	New York	1378	NY	Madison Avenue	Starbucks	+1 212-534-7225	\N	10128	\N	\N	\N	\N	\N	\N
1256	6293667225	40.7204867	-73.9842269	New York	26	NY	Clinton Street	Koneko Cat Cafe	+1 646-370-9699	\N	10002	info@konekonyc.com	\N	konekonyc	konekonyc	\N	\N
1257	6298097844	40.6834956	-73.9951868	\N	\N	\N	\N	D''Amico Coffee	+1-718-857-5403	\N	\N	\N	\N	\N	\N	\N	\N
1258	6300063006	40.6600786	-73.9808244	\N	\N	\N	\N	Terrace Bagels	\N	\N	\N	\N	\N	\N	\N	\N	\N
1259	6304108186	40.7429857	-73.9733767	\N	\N	\N	\N	Kimmel Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1260	6306935878	40.6874328	-73.9903925	\N	\N	\N	\N	One Girl Cookies	+1-212-675-4996	\N	\N	\N	\N	\N	\N	\N	\N
1261	6307037078	40.6878379	-73.9898642	\N	\N	\N	\N	Konditori	+1-347-721-3738	\N	\N	\N	\N	\N	\N	\N	\N
1262	6307037081	40.6876799	-73.9899689	\N	\N	\N	\N	Bien Cuit	+1-718-852-0200	\N	\N	\N	\N	\N	\N	\N	\N
1263	6314774119	40.6805304	-73.9945032	\N	\N	\N	\N	Planted Cafe	+1-917-909-1986	\N	\N	\N	\N	\N	\N	\N	\N
1264	6314792169	40.6779968	-73.9960712	\N	\N	\N	\N	Brooklyn Habit	+1-718-246-9463	\N	\N	\N	\N	\N	\N	\N	\N
1265	6314905340	40.6760985	-73.9987426	\N	\N	\N	\N	Simple Green	\N	\N	\N	\N	\N	\N	\N	\N	\N
1266	6319618552	40.6887402	-73.9908157	\N	95	\N	Boerum Place	Pure Green	+1-917-398-3488	10	11201	\N	\N	\N	\N	\N	\N
1267	6327650155	40.6719654	-73.9609686	Brooklyn	841	NY	Classon Avenue	Villager	\N	\N	11238	\N	\N	\N	\N	\N	\N
1268	6334491280	40.6617857	-73.9931918	\N	\N	\N	\N	Laurentino''s Pasticceria & Caffé	+1-718-832-1871	\N	\N	\N	\N	\N	\N	\N	\N
1269	6335960768	40.7453692	-73.9776863	\N	\N	\N	\N	Babylon Hookah Lounge	\N	\N	\N	\N	\N	\N	\N	\N	\N
1270	6340488794	40.6847188	-73.9949279	Brooklyn	276	NY	Court Street	Saturn Road	+13477992500	\N	11231	\N	\N	\N	\N	\N	\N
1271	6345333428	40.7312029	-73.9899196	New York	79	NY	East 10th Street	Irving Farm New York	+1-212-206-0707 x 10	\N	10003	\N	\N	\N	\N	\N	\N
1272	6345862104	40.7620218	-73.9803454	\N	\N	\N	\N	Cafe 53	\N	\N	\N	\N	\N	\N	\N	\N	\N
1273	6347916313	40.7463142	-73.9799924	\N	120	\N	East 34th Street	Utopia Bagels	+1-646-914-6981	\N	10016	\N	\N	\N	\N	\N	\N
1274	6356425186	40.7776871	-73.9783679	New York	267	NY	Columbus Avenue	TAP NYC	+1-929-930-3095	\N	10023	\N	\N	\N	\N	\N	\N
1275	6362867801	40.7431214	-73.9802602	\N	\N	\N	\N	16 Handles	\N	\N	\N	\N	\N	\N	\N	\N	\N
1276	6369348985	40.7541973	-73.9738747	\N	\N	\N	\N	Gregory''s cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1277	6371590885	40.7363825	-74.0060719	\N	581	\N	Hudson Street	MeMe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1278	6372786027	40.6908749	-73.9972733	\N	\N	\N	\N	Espresso Me	\N	\N	\N	\N	\N	\N	\N	\N	\N
1279	6376472185	40.7716285	-73.9657301	\N	888	\N	Madison Avenue	Ralph''s Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1280	6376760969	40.7466025	-73.98086	\N	\N	\N	\N	Starbucks	+1-212-725-9469	\N	\N	\N	\N	\N	\N	\N	\N
1281	6376980023	40.6778879	-73.9792905	\N	\N	\N	\N	T Baar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1282	6382251178	40.693417	-74.000816	\N	139	\N	Bridge Park Drive	Kaigo Coffee Room	+1-347-529-6180	\N	11201	\N	\N	\N	\N	\N	\N
1283	6392106685	40.7003851	-73.9226935	\N	1434	\N	\N	Dweebs	\N	\N	11237	\N	\N	\N	\N	\N	\N
1284	6399642997	40.7741707	-73.9082046	\N	36-02	\N	Ditmars Boulevard	Queen''s Room	+1-347-987-3994	\N	\N	info@queensroomnyc.com	\N	\N	\N	\N	\N
1285	6402697500	40.6970422	-73.9336001	Brooklyn	1158	NY	Myrtle Avenue	Baby Skips	+1-929-210-8101	\N	11221	\N	\N	\N	\N	\N	\N
1286	6403172421	40.7734593	-73.9598061	New York	1095	NY	Lexington Avenue	Starbucks	+1 347-658-3047	\N	10075	\N	\N	\N	\N	\N	\N
1287	6411869610	40.7443305	-73.976439	\N	\N	\N	\N	Charlotte Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1288	6412172122	40.7298631	-73.9873007	\N	\N	\N	\N	787 Coffee	+1-646-869-0130	\N	\N	\N	\N	\N	\N	\N	\N
1289	6412273637	40.7422489	-73.9831597	New York	100	NY	Lexington Avenue	Black Press Coffee	\N	\N	10016	info@blackpresscoffee.com	\N	\N	\N	\N	\N
1290	6414917575	40.6878338	-73.9934298	\N	178	\N	Court Street	Blank Street Coffee	\N	\N	11201	\N	\N	\N	\N	\N	\N
1291	6419733289	40.7231443	-73.9947458	\N	242	\N	Mott Street	Café Gitane	+1 212-334-9552	\N	10012	\N	\N	\N	\N	\N	\N
1292	6422248286	40.7295309	-74.0015887	\N	201	\N	Bleecker Street	Porto Rico Importing Co.	212 477 5421	\N	\N	\N	\N	\N	\N	\N	\N
1293	6424150278	40.8242896	-73.8367552	Bronx	815	NY	Hutchinson River Parkway	Starbucks	+1 718-536-2689	\N	10465	\N	\N	\N	\N	\N	\N
1294	6433061916	40.6761808	-73.9990416	\N	\N	\N	\N	Nerd Be Cool	\N	\N	\N	\N	\N	\N	\N	\N	\N
1295	6441649386	40.758854	-73.9883847	New York	694	NY	8th Avenue	Sugar Factory	+1-347-721-9066	\N	10036	\N	\N	\N	\N	\N	\N
1296	6442303487	40.6431615	-73.7825919	\N	\N	\N	\N	Camden Food Co.	\N	\N	\N	\N	\N	\N	\N	\N	\N
1297	6453371196	40.689462	-73.9859753	Brooklyn	40	NY	Hoyt Street	Kung Fu Tea	+1-347-294-0232	\N	11201	\N	\N	\N	\N	\N	\N
1298	6456450337	40.689583	-73.9859909	Brooklyn	206	NY	Livingston Street	O Poke	+1-718-664-3303	\N	11201	\N	\N	\N	\N	\N	\N
1299	6461990216	40.7443072	-73.9861386	\N	15	\N	East 28th Street	Bourke Street Bakery	\N	\N	10016	\N	\N	\N	\N	\N	\N
1300	6462532126	40.7303245	-73.9895846	\N	30	\N	3rd Avenue	ViVi Bubble Tea	\N	\N	10003	\N	\N	\N	\N	\N	\N
1301	6465804985	40.6896286	-73.9882049	\N	71	\N	Smith Street	White Noise	\N	\N	11201	\N	\N	\N	\N	\N	\N
1302	6467315461	40.6779446	-73.9908632	\N	365	\N	Bond Street	Bond Street Coffee and Goods	+1-718-852-7323	\N	11231	\N	\N	\N	\N	\N	\N
1303	6473280860	40.7286956	-73.9787601	New York	512	NY	Avenue B	B Cup Café	+1 212-228-4808	\N	10009	bcupcafe@gmail.com	\N	\N	\N	\N	\N
1304	6476814366	40.675733	-73.9805144	\N	665	\N	President Street	Enso	\N	\N	11215	\N	\N	\N	\N	\N	\N
1305	6497976386	40.7643238	-73.9887289	New York	403	NY	West 51st Street	The Coffee Pot	+1-917-265-8014	\N	10019	\N	\N	\N	\N	\N	\N
1306	6500461143	40.6888776	-73.9921479	\N	212B	\N	Pacific Street	Stumptown No 12	\N	\N	11201	\N	\N	\N	\N	\N	\N
1307	6507019906	40.7518367	-73.9902569	New York	462	NY	7th Avenue	Starbucks	+1 212-279-6432	\N	10018	\N	\N	\N	\N	\N	\N
1308	6511878535	40.8157311	-73.9451417	New York	236	\N	West 135th Street	Acts III Bagels	+1 212 2812287	\N	10030	\N	\N	\N	\N	\N	\N
1309	6516818726	40.5978165	-73.985207	\N	\N	\N	\N	A Bar	+1-917-254-8982	\N	\N	\N	\N	\N	\N	\N	\N
1310	6525036187	40.7398248	-73.977416	\N	\N	\N	\N	Proof Coffee Roasters	+1-212-689-1000	\N	\N	\N	\N	\N	\N	\N	\N
1311	6534166842	40.6903087	-73.9916493	\N	\N	\N	\N	About Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1312	6536906987	40.7639054	-73.977729	\N	1385	\N	6th Avenue	Zibetto Espresso Bar	+1 646-707-0505	\N	10019	\N	\N	https://www.instagram.com/zibettoespresso	\N	\N	\N
1313	6542803861	40.7472769	-73.9750012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1314	6549322049	40.8029397	-73.956201	New York	2104	NY	Frederick Douglass Boulevard	Cafe Frederick	+1-212-222-1987	\N	10026	\N	\N	\N	\N	\N	\N
1315	6550407925	40.7335428	-74.0039268	New York	87	NY	Christopher Street	Matchaful	+15859864358	\N	10014	\N	\N	\N	\N	\N	\N
1316	6551670585	40.7149012	-73.9986222	New York	33	\N	Pell Street	Miss Du’s Tea Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
1317	6558563123	40.7263237	-73.9838601	New York	131	NY	East 7th Street	787 Coffee Co.	+1-646-649-2774	\N	10009	\N	\N	\N	\N	\N	\N
1318	6558563124	40.7340227	-74.0005435	New York	15	NY	Christopher Street	ad hoc collective coffee + shoppe	\N	\N	10014	\N	\N	\N	\N	\N	\N
1319	6561269443	40.7602787	-73.9907472	\N	359	\N	West 45th Street	Bird & Branch	+1-917-265-8444	\N	\N	info@birdandbranch.com	\N	\N	\N	\N	\N
1320	6566684054	40.7531459	-73.9851227	New York	1040	NY	6th Avenue	Starbucks	+1 212-302-2132	\N	10018	\N	\N	\N	\N	\N	\N
1321	6568734640	40.7177214	-73.992045	\N	290	\N	Grand Street	The Grand Daddy	+1-917-388-2233	\N	10002	\N	\N	\N	\N	\N	\N
1322	6575702086	40.762741	-73.9739034	\N	727	\N	5th Avenue	Blue Box Cafe - Tiffany	\N	\N	\N	\N	\N	\N	\N	\N	\N
1323	6577103334	40.6988989	-74.038919	\N	\N	\N	\N	Ellis Island Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1324	6605132001	40.7522199	-74.0017007	New York	500	NY	West 30th Street	Think Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1325	6611254398	40.7462448	-73.9894965	\N	\N	\N	\N	Paper	\N	\N	\N	\N	\N	\N	\N	\N	\N
1326	6611254401	40.7456554	-73.9880474	\N	\N	\N	\N	Stumptown Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1327	6612404170	40.735804	-73.9926767	\N	\N	\N	\N	Le Café coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1328	6612404175	40.7541498	-73.9787021	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
1329	6612404178	40.7555697	-73.9802192	New York	2	NY	West 45th	Starbucks	+1 212-869-0619	\N	10036	\N	\N	\N	\N	\N	\N
1330	6615272821	40.7578879	-73.9831141	\N	\N	\N	\N	For five coffee roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1331	6615272822	40.7570592	-73.9811663	New York	55	NY	West 46th Street	Starbucks	+1 646-647-5558	\N	10036	\N	\N	\N	\N	\N	\N
1332	6615272823	40.756182	-73.9810387	\N	\N	\N	\N	Manhattan	\N	\N	\N	\N	\N	\N	\N	\N	\N
1333	6621617746	40.7341509	-73.9923907	\N	\N	\N	\N	Blue Bottle Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1334	6621617747	40.7358148	-73.9976834	\N	\N	\N	\N	O Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
1335	6621617750	40.7326818	-73.9902436	\N	114	\N	4th Avenue	Paradis	+1-646-416-6709	\N	10003	\N	\N	\N	\N	\N	\N
1336	6621617751	40.7347019	-73.9929545	\N	\N	\N	\N	Blue stripes	\N	\N	\N	\N	\N	\N	\N	\N	\N
1337	6621617759	40.739814	-73.999021	\N	\N	\N	\N	Yanni''s coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1338	6630517160	40.7276195	-74.0074601	New York	345	NY	Hudson Street	Starbucks	+1 646-486-0514	\N	10014	\N	\N	\N	\N	\N	\N
1339	6630517163	40.7277372	-74.0070702	New York	350	NY	Hudson Street	Gregorys Coffee	+1-646-657-0803	\N	10014	\N	\N	\N	\N	\N	\N
1340	6631198486	40.757132	-73.9733698	\N	\N	\N	\N	Church Cafe Outside	\N	\N	\N	\N	\N	\N	\N	\N	\N
1341	6631461418	40.7571723	-73.9734536	\N	\N	\N	\N	Inside Park at St. Beet’s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1342	6635017885	40.7581131	-73.974725	\N	30	\N	East 51st Street	Pomme Palais Bakery and Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1343	6636462195	40.715754	-74.003128	New York	111	NY	Worth Street	Starbucks	+1 212-964-8846	\N	10013	\N	\N	\N	\N	\N	\N
1344	6638585608	40.7508895	-73.9978633	\N	\N	\N	\N	Cafe Bravo	\N	\N	\N	\N	\N	\N	\N	\N	\N
1345	6639326250	40.7269517	-73.7137926	Bellerose	251-05	NY	Jamaica Avenue	Starbucks	+1 718-347-1304	\N	11426	\N	\N	\N	\N	\N	\N
1346	6666722028	40.754399	-73.993352	New York	320	NY	West 37th Street	The People''s Forum	+1 347-695-1095	\N	10018	info@peoplesforum.org	\N	peoplesforumnyc	PeoplesForumNYC	\N	\N
1347	6670244825	40.7676839	-73.9528947	\N	\N	\N	\N	Claire''s Kitchen Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1348	6670244863	40.7654726	-73.9581504	\N	359	\N	East 68th Street	MATTO	\N	\N	\N	\N	\N	\N	\N	\N	\N
1349	6670244872	40.7663291	-73.9599375	\N	1298	\N	2nd Avenue	Gotham Café	\N	\N	10065	\N	\N	\N	\N	\N	\N
1350	6676466677	40.6194688	-74.0328783	Brooklyn	9124	NY	3rd Avenue	Paneantico	+1-718-680-2347	\N	11209	\N	\N	\N	\N	\N	\N
1351	6677928152	40.6688526	-73.9852378	Brooklyn	337	NY	9th Street	Golden Shovel	\N	\N	11215	\N	\N	\N	\N	\N	\N
1352	6680404242	40.6806896	-73.9777186	\N	76	\N	5th Avenue	Kung Fu Tea	\N	\N	11217	\N	\N	\N	\N	\N	\N
1353	6680695923	40.7526738	-73.9950505	New York	330	NY	West 34th Street	Starbucks	+1 917-576-1959	\N	10001	\N	\N	\N	\N	\N	\N
1354	6681744660	40.6887441	-73.9629364	Brooklyn	325	NY	Lafayette Avenue	Starbucks	+1 718-230-0007	\N	11205	\N	\N	\N	\N	\N	\N
1355	6682052647	40.7090225	-73.9639893	Brooklyn	419	NY	Bedford Avenue	Avenue Cafe	+1-718-384-6956	\N	\N	\N	\N	\N	\N	\N	\N
1356	6691104536	40.7716694	-73.9529322	\N	1496	\N	1st Avenue	East Side Bagel Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1357	6693352326	40.7023693	-73.9016351	Ridgewood	880	NY	Woodward Avenue	Porcelain	+1-646-641-7015	\N	11385	\N	\N	\N	\N	\N	\N
1358	6693478207	40.7327461	-73.9883025	\N	134	\N	East 13th Street	Everyman Espresso	\N	\N	10003	\N	\N	\N	\N	\N	\N
1359	6696993241	40.7138499	-73.9908808	New York	151	NY	East Broadway	Kopitiam Malaysian Coffee	+1-646-609-3785	\N	10002	\N	\N	\N	\N	\N	\N
1360	6700595180	40.5440449	-74.1652626	Staten Island	3846	NY	Richmond Avenue	Krave It Café	+1-347-562-4673	\N	10312	\N	\N	\N	\N	\N	\N
1361	6700595182	40.5441934	-74.164982	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1362	6709938306	40.6867951	-73.9236409	Brooklyn	94	NY	Ralph Avenue	Familiars Vegan Coffee Shop	+1-347-295-2574	\N	11221	familiarsbk@gmail.com	\N	\N	\N	\N	\N
1363	6711404685	40.5818133	-74.1659995	\N	\N	\N	\N	Gong Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
1364	6719106993	40.7033645	-73.9912069	\N	\N	\N	\N	Almondine Bakery	+1-718-797-5026	\N	\N	\N	\N	\N	\N	\N	\N
1365	6734071958	40.7276892	-74.0004432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1366	6743201150	40.7592498	-73.9527737	\N	455	\N	Main Street	Jupioca	\N	\N	\N	\N	\N	\N	\N	\N	\N
1367	6744695372	40.7502199	-73.9401895	Long Island City	25-14	NY	Queens Plaza South	Starbucks	+1 718-433-4844	\N	11101	\N	\N	\N	\N	\N	\N
1368	6744726774	40.7439734	-73.9148875	\N	43-12	\N	50th Street	New City Billiards & Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1369	6752564944	40.7418737	-73.9933052	New York	684	NY	6th Avenue	Starbucks	+1 212-691-1948	\N	10010	\N	\N	\N	\N	\N	\N
1370	6757143486	40.6829912	-73.953657	\N	\N	\N	\N	Martha''s Pastries & Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1371	6757777586	40.7598078	-73.9876125	\N	\N	\N	\N	Patis	\N	\N	\N	\N	\N	\N	\N	\N	\N
1372	6761763979	40.7207076	-73.9577014	Brooklyn	101	NY	North 10th Street	Marcy and Myrtle	\N	\N	\N	\N	\N	\N	\N	\N	\N
1373	6764076981	40.747162	-73.9418041	Long Island City	26-14	NY	Jackson Avenue	Starbucks	+1 347-533-2101	\N	11101	\N	\N	\N	\N	\N	\N
1374	6775505585	40.7294889	-73.9910994	\N	68	\N	Cooper Square	Gold Bao	\N	\N	10003	\N	\N	\N	\N	\N	\N
1375	6781597689	40.7715862	-73.8661845	\N	\N	\N	\N	World Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
1376	6784987781	40.783644	-73.9777252	New York	417	NY	Amsterdam Avenue	Bluestone Lane	+1-718-374-6858	\N	10024	\N	\N	\N	\N	\N	\N
1377	6789471481	40.7646846	-73.9665681	New York	822	NY	Lexington Avenue	Starbucks	+1 212-572-0984	\N	10065	\N	\N	\N	\N	\N	\N
1378	6791111462	40.6358689	-74.0089533	\N	5903	\N	8th Avenue	Tiger Sugar	1-718-438-2358	\N	11220	\N	\N	\N	\N	\N	\N
1379	6791611135	40.7742751	-73.9808432	New York	159	NY	Columbus Avenue	The Migrant Kitchen	\N	\N	\N	\N	\N	\N	\N	\N	\N
1380	6796160726	40.723174	-73.94425	\N	142	\N	Driggs Avenue	Variety Coffee	+1 718-497-2326	\N	\N	\N	\N	\N	\N	\N	\N
1381	6800246087	40.7345902	-73.9582212	\N	\N	\N	\N	Café Alula	\N	\N	\N	\N	\N	\N	\N	\N	\N
1382	6800262485	40.7304598	-73.9581342	Brooklyn	80	NY	Kent Street	Maman	+1-347-689-9195	\N	11222	\N	\N	\N	\N	\N	\N
1666	9543899218	40.7337757	-74.0054727	\N	\N	\N	\N	Oslo Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1383	6814990054	40.6304226	-74.0283804	Brooklyn	7612	NY	3rd Avenue	Omonia Cafe	+1-718-491-1435	\N	11209	\N	\N	\N	\N	\N	\N
1384	6816991370	40.7399793	-73.9841814	\N	23	\N	Lexington Avenue	Smile To Go	+1-212-529-1580	\N	10010	\N	\N	\N	\N	\N	\N
1385	6818236367	40.6775944	-74.0182684	\N	185	\N	Van Dyke Street	Uhuru Design	\N	\N	11231	\N	\N	\N	\N	\N	\N
1386	6833456286	40.7429989	-74.007331	New York	\N	NY	High Line	Hearth on the High Line	+1-646-602-1300	72	10011	info@restauranthearth.com	\N	\N	\N	\N	\N
1387	6839024569	40.6910101	-73.9959583	\N	311	\N	Henry Street	Amy''s Bread	\N	\N	11201	\N	\N	\N	\N	\N	\N
1388	6852143017	40.7491928	-73.9751891	New York	605	NY	3rd Avenue	Starbucks	+1 917-574-4123	\N	10016	\N	\N	\N	\N	\N	\N
1389	6852842985	40.7473146	-74.0046803	\N	\N	\N	\N	Juban	\N	\N	\N	\N	\N	\N	\N	\N	\N
1390	6859180119	40.6891039	-73.9859325	Brooklyn	45	NY	Hoyt Street	Starbucks	+1 718-797-1777	\N	11201	\N	\N	\N	\N	\N	\N
1391	6872279129	40.7058096	-73.9219002	\N	\N	\N	\N	Hala Coffee & Kitchen	+1-718-821-1850	\N	\N	\N	\N	\N	\N	\N	\N
1392	6872279133	40.7058618	-73.9219914	Brooklyn	40	NY	Wyckoff Avenue	The Bad Bagel	+1-929-324-3130	\N	11237	\N	\N	\N	\N	\N	\N
1393	6874194970	40.661254	-73.9937327	\N	\N	\N	\N	Dee Dee''s Sweets & Treats	\N	\N	\N	\N	\N	\N	\N	\N	\N
1394	6876199945	40.6908789	-73.9567887	\N	\N	\N	\N	La Villa Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
1395	6876199946	40.6906742	-73.9584138	\N	\N	\N	\N	Initial Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1396	6876895217	40.6923347	-73.9458487	\N	194	\N	Tompkins Avenue	Bklyn Blend	+1-718-484-2247	\N	11206	\N	\N	\N	\N	\N	\N
1397	6894162189	40.699063	-73.8073413	Jamaica	93-40	NY	Sutphin Boulevard	Tim Hortons	+1 718-725-0002	\N	11435	\N	\N	\N	\N	\N	\N
1398	6898244691	40.7795881	-73.9774283	New York	322	NY	Columbus Avenue	Da Capo	+ 1 646 882 0197	\N	10023	\N	\N	\N	\N	\N	\N
1399	6898319068	40.6454846	-73.7778471	\N	\N	\N	\N	Paris Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1400	6898814394	40.654643	-74.0043906	\N	\N	\N	\N	Sunset Bagels	+1-718-514-6422	\N	\N	\N	\N	\N	\N	\N	\N
1401	6900833957	40.6140623	-74.0348887	\N	9905	\N	3rd Avenue	Beets and Carrots	\N	\N	11209	\N	\N	\N	\N	\N	\N
1402	6903042182	40.7178852	-74.0002468	\N	153	\N	Centre Street	Spring Cafe	+1 212-226-9669	\N	\N	\N	\N	\N	\N	\N	\N
1403	6910698803	40.7213951	-73.9880234	\N	\N	\N	\N	Bonsai Kakigori	\N	\N	\N	\N	\N	\N	\N	\N	\N
1404	6916463756	40.7272465	-73.9866334	\N	74	\N	East 7th Street	Setsugekka	+1-646-895-9586	\N	\N	\N	\N	\N	\N	\N	\N
1405	6916667785	40.7064892	-74.0041271	\N	181	\N	Front Street	Beatnic	\N	\N	\N	\N	\N	\N	\N	\N	\N
1406	6916679485	40.7071884	-74.0030763	\N	\N	\N	\N	Big Gay Ice Cream	\N	\N	\N	\N	\N	\N	\N	\N	\N
1407	6916949630	40.7474576	-73.9917001	\N	143	\N	West 29th Street	Hanamizuki	+1 212-965-5533	\N	\N	\N	\N	\N	\N	\N	\N
1408	6919152919	40.7180129	-74.0019883	\N	33	\N	Cortlandt Alley	Sawada Coffee	\N	\N	10013	\N	\N	\N	\N	\N	\N
1409	6925129153	40.6501904	-74.0048024	\N	\N	\N	\N	La Flor de Izucar	+1-718-633-1254	\N	\N	\N	\N	\N	\N	\N	\N
1410	6927242624	40.7675953	-73.8597117	\N	\N	\N	\N	Birch Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1411	6932788478	40.6380601	-74.0064004	Brooklyn	806	NY	55th Street	Kung Fu Tea	1-718-633-5588	\N	11220	\N	\N	\N	\N	\N	\N
1412	6937498381	40.7700367	-73.9623088	\N	\N	\N	\N	Joe & The Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
1413	6938011085	40.728704	-73.863702	\N	\N	\N	\N	Chaikhana Sem Sorok	\N	\N	\N	\N	\N	\N	\N	\N	\N
1414	6940016036	40.7189073	-73.9901737	\N	79	\N	Delancey Street	Rise Brewing Company	+1-646-400-0410	\N	10002	\N	\N	\N	\N	\N	\N
1415	6941252618	40.7169602	-73.9947013	New York	124	NY	Hester Street	Bambu	+1 347-236-3185	\N	10002	nychinatown@drinkbambu.com	\N	\N	\N	\N	\N
1416	6943787241	40.6676636	-73.9589017	\N	905A	\N	Franklin Avenue	Koala Café	\N	\N	11225	\N	\N	\N	\N	\N	\N
1417	6952884368	40.7000569	-73.9411085	Brooklyn	774	NY	Broadway	Starbucks	+1 917-246-0280	\N	11206	\N	\N	\N	\N	\N	\N
1418	6955003385	40.7512185	-73.9743935	\N	\N	\N	3rd Avenue	Joe The Juice Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1419	6955034549	40.7416427	-73.9903239	New York	14	NY	West 23rd Street	Starbucks	+1 212-367-2050	\N	10010	\N	\N	\N	\N	\N	\N
1420	6955898919	40.7162732	-73.7449665	\N	\N	\N	\N	Victor’s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1421	6966637055	40.6119143	-73.9831641	\N	\N	\N	\N	Vivi''s Bubble Tea	+1-917-933-9978	\N	\N	\N	\N	\N	\N	\N	\N
1422	6980049833	40.758667	-73.8309328	Flushing	135-15	NY	40th Road	Yi Fang Tea	\N	\N	11354	\N	\N	\N	\N	\N	\N
1423	6980049847	40.7592353	-73.8301751	Flushing	40-10	NY	Main Street	Tiger Sugar	\N	\N	11354	\N	\N	\N	\N	\N	\N
1424	6992697770	40.7107631	-73.7933421	Jamaica	168-45	NY	Hillside Avenue	Smart 3 Café	+1 929-589-7760	\N	11432	\N	\N	\N	\N	\N	\N
1425	7036452476	40.7398896	-73.9821488	\N	335	\N	3rd Avenue	Sunflower Cafe	+1-917-262-0804	\N	10010	\N	\N	\N	\N	\N	\N
1426	7038487786	40.6222362	-74.0287935	\N	8626	\N	4th Avenue	Gigi’s Bakery	\N	\N	11209	\N	\N	\N	\N	\N	\N
1427	7040457482	40.7161905	-73.9571819	\N	583	\N	Driggs Avenue	Gusto Latino Cafe Rest	\N	\N	11211	\N	\N	\N	\N	\N	\N
1428	7040598185	40.7643995	-73.969084	\N	\N	\N	\N	Sant Ambroeus	\N	\N	\N	\N	\N	\N	\N	\N	\N
1429	7041755289	40.771859	-73.9592877	\N	\N	\N	\N	Joe & The Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
1430	7047104991	40.7210501	-73.997846	\N	408	\N	Broome Street	Despaña	+1-212-219-5050	\N	10013	\N	\N	\N	\N	\N	\N
1431	7052629733	40.7177378	-74.0000133	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1432	7054940498	40.7792219	-73.9479072	\N	1729	\N	1st Avenue	Mellow Yellow Coffee & Vibes	+1 212-722-7220	\N	\N	\N	\N	\N	\N	\N	\N
1433	7072426842	40.6192573	-74.0329705	Brooklyn	9202	NY	3rd Avenue	Starbucks	+1 718-492-5331	\N	11209	\N	\N	\N	\N	\N	\N
1434	7078534437	40.7291469	-73.9855877	New York	224	NY	East 10th Street	Hard to Explain	\N	\N	10003	\N	\N	\N	\N	\N	\N
1435	7084620591	40.7330316	-73.9809522	\N	286	\N	1st Avenue	Starbucks	+1 212-353-1214	\N	10009	\N	\N	\N	\N	\N	\N
1436	7093921924	40.757792	-73.9796085	New York	28	NY	West 48th Street	Starbucks	+1 646-860-8626	\N	10036	\N	\N	\N	\N	\N	\N
1437	7093921939	40.7565007	-73.9778114	\N	\N	\N	\N	Cafe Alice	\N	\N	\N	\N	\N	\N	\N	\N	\N
1438	7093921948	40.7568104	-73.9811459	\N	\N	\N	\N	Café Cello	+1-212-764-8600	\N	\N	\N	\N	\N	\N	\N	\N
1439	7093921956	40.7588628	-73.9789097	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
1440	7094126612	40.7984981	-73.9686236	\N	2680	\N	Broadway	Picky Barista	+1-646-684-3037	\N	10025	\N	\N	\N	\N	\N	\N
1441	7097820976	40.7003629	-73.9932875	Brooklyn	43	NY	Hicks Street	Alice''s Tea Cup To Go	\N	\N	11201	\N	\N	\N	\N	\N	\N
1442	7097867546	40.7225587	-73.988108	\N	\N	\N	\N	Dr Smood - Orchard	\N	\N	\N	\N	\N	\N	\N	\N	\N
1443	7118282583	40.6082646	-74.0046167	Brooklyn	1712	NY	86th Street	Gotcha Cafe	+1-347-789-7878	\N	11214	\N	\N	\N	\N	\N	\N
1444	7124991341	40.6804868	-73.9680977	\N	\N	\N	\N	Ciao Gloria	+1-716-666-2426	\N	\N	\N	\N	\N	\N	\N	\N
1445	7126735715	40.6547688	-74.0042563	\N	\N	\N	\N	Cafe Nube	\N	\N	\N	\N	\N	\N	\N	\N	\N
1446	7126840190	40.635656	-74.0233237	\N	\N	\N	\N	The Attic	\N	\N	\N	\N	\N	\N	\N	\N	\N
1447	7126840192	40.6349682	-74.0235906	\N	\N	\N	\N	Lux Bakery	+1-718-680-2988	\N	\N	\N	\N	\N	\N	\N	\N
1448	7129638751	40.687233	-73.9933922	\N	\N	\N	\N	Carlotte Patisserie	+1-929-295-0372	\N	\N	\N	\N	\N	\N	\N	\N
1449	7132140604	40.6910704	-73.9915223	\N	\N	\N	\N	Paris Baguette	+1-718-797-0404	\N	\N	\N	\N	\N	\N	\N	\N
1450	7134303414	40.7618661	-73.9730709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1451	7147454646	40.6900359	-73.9653948	\N	\N	\N	\N	Rosalu Diner	\N	\N	\N	\N	\N	\N	\N	\N	\N
1452	7150082985	40.7238897	-73.9967151	\N	\N	\N	\N	T2 tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1453	7159234142	40.791353	-73.9725728	New York	650	NY	Amsterdam Avenue	Edgar''s Cafe	\N	\N	10025	\N	\N	\N	\N	\N	\N
1454	7165158294	40.6708551	-73.9850972	\N	\N	\N	\N	390 Social	+1-718-734-2902	\N	\N	\N	\N	\N	\N	\N	\N
1455	7177751484	40.6876887	-73.9793247	\N	78	\N	Rockwell Place	Coffee Project New York	+1-585-888-3153	\N	11217	\N	\N	\N	\N	\N	\N
1456	7178256995	40.6869181	-73.9786569	\N	15	\N	Lafayette Avenue	Pub Date	\N	\N	11217	\N	\N	\N	\N	\N	\N
1457	7194308185	40.78367	-73.9781784	New York	412	NY	Amsterdam Avenue	Sandwell	+1-212-321-7911	\N	10024	\N	\N	\N	\N	\N	\N
1458	7195308557	40.8327737	-73.9135292	Bronx	1205	NY	College Avenue	Jam Rock Cafe	\N	\N	10456	\N	\N	\N	\N	\N	\N
1459	7195334843	40.8327788	-73.9201009	Bronx	1125	NY	Grand Concourse	Caffeine on The Concourse	\N	\N	10452	\N	\N	\N	\N	\N	\N
1460	7208905972	40.6801347	-73.9971248	\N	412	\N	Court Street	Brooklyn Bread	+1-929-250-2715	\N	11231	\N	\N	\N	\N	\N	\N
1461	7212990518	40.6458041	-73.7723637	\N	\N	\N	\N	Cibo Express	\N	\N	\N	\N	\N	\N	\N	\N	\N
1462	7212990525	40.6459047	-73.7735306	\N	\N	\N	\N	World Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
1463	7221421720	40.7474297	-73.9030501	Woodside	60-11	NY	39th Avenue	Bee Cafe	\N	\N	11377	\N	\N	\N	\N	\N	\N
1464	7223921085	40.7170895	-73.961193	\N	\N	\N	\N	Republic of Booza	\N	\N	\N	\N	\N	\N	\N	\N	\N
1465	7239728455	40.7880551	-73.9537505	\N	1400	\N	Madison Avenue	Joe & The Juice	\N	\N	10029	\N	\N	\N	\N	\N	\N
1466	7243548686	40.7232721	-73.9507783	\N	\N	\N	\N	Anima Mundi	\N	\N	\N	\N	\N	\N	\N	\N	\N
1467	7253393300	40.6971809	-73.934507	\N	\N	\N	\N	Leaf Eatery	\N	\N	\N	\N	\N	\N	\N	\N	\N
1468	7254232934	40.6434141	-73.9697939	\N	\N	\N	\N	Red Mist Hookah Lounge	\N	\N	\N	\N	\N	\N	\N	\N	\N
1469	7258184197	40.7414369	-73.9744358	\N	\N	\N	\N	Argo Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1470	7259558970	40.807773	-73.9531593	\N	\N	\N	\N	Zoe Café and Hookah Lounge	\N	\N	\N	\N	\N	\N	\N	\N	\N
1471	7278363017	40.6307207	-74.1033559	Staten Island	422	NY	Forest Avenue	Bean and Leaves Coffee and Tea Cafe	\N	\N	10301	\N	\N	\N	\N	\N	\N
1472	7288725909	40.8310165	-73.8779366	Bronx	1265	NY	Ward Avenue	ABC Cafe	\N	\N	10472	\N	\N	\N	\N	\N	\N
1473	7297326137	40.6431597	-74.1036994	Staten Island	\N	NY	Cottage Row	Harbor Eats	\N	\N	10301	\N	\N	\N	\N	\N	\N
1474	7314202222	40.7306776	-73.9952135	New York	31	NY	Waverly Place	Kung Fu Tea	\N	\N	10003	\N	\N	\N	\N	\N	\N
1475	7330107131	40.7710875	-73.9905939	New York	860	NY	11th Avenue	Li''l Jay''s Cafe	\N	\N	10019	\N	\N	\N	\N	\N	\N
1476	7360048859	40.7404201	-73.9859376	\N	303	\N	Park Avenue South	Paris Baguette	\N	\N	10010	\N	\N	\N	\N	\N	\N
1477	7360048873	40.7377576	-73.9878579	\N	235	\N	Park Avenue South	Union Square Cafe	+1-212-243-4020	\N	10003	\N	\N	\N	\N	\N	\N
1478	7363764833	40.729577	-73.9788303	\N	534	\N	East 14th Street	Perk	\N	\N	10009	\N	\N	\N	\N	\N	\N
1479	7368466282	40.7482654	-73.9884306	New York	1271	NY	Broadway	Biao Sugar	\N	\N	10001	\N	\N	\N	\N	\N	\N
1480	7369844955	40.7442688	-73.9891139	\N	1151	\N	Broadway	Dr. Smood	+1-646-713-1380	\N	10001	\N	\N	\N	\N	\N	\N
1481	7395477870	40.8072257	-73.9596805	New York	420	NY	West 118th Street	Publique	\N	\N	10027	\N	\N	\N	\N	\N	\N
1482	7412863961	40.7607202	-73.8295224	Flushing	136-17	NY	39th Avenue	Kung Fu Tea	\N	\N	11354	\N	\N	\N	\N	\N	\N
1483	7424179942	40.7230127	-73.9456976	Brooklyn	182	NY	Driggs Avenue	Crema Brooklyn	\N	\N	11222	\N	\N	\N	\N	\N	\N
1484	7475192460	40.7691681	-73.9882442	New York	475	NY	West 57th Street	Starbucks	+1 212-247-5489	\N	10019	\N	\N	\N	\N	\N	\N
1485	7505992414	40.8673515	-73.8302712	Bronx	346	NY	Baychester Avenue	Starbucks	+1 718-671-2067	\N	10475	\N	\N	\N	\N	\N	\N
1486	7591060173	40.7728466	-73.9898648	New York	21	NY	West End Avenue	Starbucks	+1 929-243-0630	\N	10023	\N	\N	\N	\N	\N	\N
1487	7620039824	40.8058245	-73.9412641	\N	22	\N	\N	Serengeti Teas & Spices	\N	\N	\N	\N	\N	\N	\N	\N	\N
1488	7653745278	40.7483337	-73.9937884	\N	221	\N	West 29th Street	Ninth Street Espresso	\N	\N	10001	\N	\N	\N	\N	\N	\N
1489	7656550169	40.6358941	-74.0129469	\N	6122	\N	7th Avenue	Prince Tea House	+19293377150	\N	11220	\N	\N	\N	\N	\N	\N
1490	7656695500	40.6367635	-74.0088184	Brooklyn	774	NY	58th Street	Yi Fang Tea	\N	\N	11220	\N	\N	\N	\N	\N	\N
1491	7678152117	40.740175	-73.9868031	New York	304	NY	Park Avenue South	Starbucks	+1-212-475-9025	\N	10010	\N	\N	\N	\N	\N	\N
1492	7678152118	40.7402786	-73.9870432	New York	48	\N	East 23rd Street	Spin	+1-212-982-8802	\N	10010	\N	\N	\N	\N	\N	\N
1493	7678152127	40.7407221	-73.9880906	New York	24	\N	East 23rd Street	Snowfox Cafe	\N	\N	10010	\N	\N	\N	\N	\N	\N
1494	7685677612	40.7408507	-74.0033241	\N	328	\N	West 15th Street	Terremoto Coffee	+1 212-243-4300	\N	10011	info@terremotocoffee.com	\N	\N	\N	\N	\N
1495	7714514231	40.7657315	-73.9309349	Astoria	21-03A	NY	Broadway	Starbucks	+1 718-874-3582	\N	11106	\N	\N	\N	\N	\N	\N
1496	7722146852	40.771319	-73.9222831	\N	25-11	\N	Astoria Boulevard	Coffee & Cake	\N	\N	11102	\N	\N	\N	\N	\N	\N
1497	7732026821	40.7672465	-73.9171552	\N	34-15	\N	28th Avenue	Sonbob’s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1498	7779637983	40.5180554	-74.2355326	\N	\N	\N	\N	E Squared Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
1499	7781914584	40.5216465	-74.2355418	Richmond Valley Plaza	106	NY	Page Avenue	Starbucks	+1 718-356-1090	\N	10309	\N	\N	\N	\N	\N	\N
1500	7788619750	40.5222196	-74.2388872	\N	\N	\N	\N	Beans & Leaves	\N	\N	\N	\N	\N	\N	\N	\N	\N
1501	7795039231	40.6915053	-73.9864292	Brooklyn	156	NY	Lawrence Street	Gong Cha	+1-917-909-1207	\N	11201	\N	\N	\N	\N	\N	\N
1502	7795039234	40.6920093	-73.9850009	Brooklyn	100	NY	Willoughby Street	Ava Brew	\N	\N	11201	\N	\N	\N	\N	\N	\N
1503	7801840745	40.7722798	-73.9206498	\N	26-08	\N	\N	The Barn	\N	\N	\N	\N	\N	\N	\N	\N	\N
1504	7808355546	40.621825	-74.0319142	\N	\N	\N	\N	HôM	+1-718-238-4466	\N	\N	\N	\N	\N	\N	\N	\N
1505	7917516338	40.7644605	-73.7262272	Little Neck	254-21	NY	Nassau Boulevard	Starbucks	+1 718-428-2489	\N	11362	\N	\N	\N	\N	\N	\N
1506	7920742160	40.7458317	-73.8999102	\N	64-04	\N	Roosevelt Avenue	Sabroso Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
1507	7964143166	40.7553536	-73.9564818	New York	2	NY	West Loop Road	The Café @ Cornell Tech	\N	\N	10044	\N	\N	\N	\N	\N	\N
1508	7975003159	40.7202081	-74.0021478	New York	53	NY	Howard Street	La Mercerie	+1-212-852-9097	\N	10013	LAMERCERIE.INFO@STARR-RESTAURANT.COM	\N	\N	\N	\N	\N
1509	8001556848	40.7647479	-73.8241127	Flushing	141-47	NY	Northern Boulevard	UNICORN GLOW	\N	\N	11358	\N	\N	\N	\N	\N	\N
1510	8034581117	40.7189613	-73.9859844	New York	116	NY	Suffolk Street	Bluestockings	+1-212-777-6028	\N	10002	\N	\N	\N	\N	\N	\N
1511	8047166470	40.7611903	-73.9240141	Astoria	32-20	\N	Broadway	Omonia Cafe	(718) 274-6650	\N	11106	\N	\N	\N	\N	\N	\N
1512	8097694955	40.7383802	-73.9825391	\N	\N	\N	\N	Pick a Bagel	+1-212-686-1414	\N	\N	\N	\N	\N	\N	\N	\N
1513	8098670922	40.6263637	-73.9169027	Brooklyn	2177	NY	Ralph Avenue	Starbucks	+1 718-251-3518	\N	11234	\N	\N	\N	\N	\N	\N
1514	8105873283	40.7179833	-73.9581705	Brooklyn	154	NY	North 7th Street	Starbucks Reserve	+1 718-384-0152	\N	11211	\N	\N	\N	\N	\N	\N
1515	8108885113	40.6762444	-73.9504296	\N	1077	\N	Bergen Street	Cotton Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
1516	8109403685	40.7137246	-73.9494826	Brooklyn	561	NY	Lorimer Street	Poetica Coffee	\N	\N	11211	\N	\N	\N	\N	\N	\N
1517	8109403686	40.7135773	-73.949434	Brooklyn	557	NY	Lorimer Street	Porteñas	\N	\N	11211	\N	\N	\N	\N	\N	\N
1518	8111388488	40.7141926	-73.9508267	\N	543	\N	Metropolitan Avenue	Brooklyn Roasting Company	\N	\N	\N	\N	\N	\N	\N	\N	\N
1519	8149503340	40.6893113	-73.9884523	Brooklyn	71	NY	Smith Street	Debutea	+1-347-889-5433	\N	11201	debuteabrooklyn@gmail.com	\N	\N	\N	\N	\N
1520	8151649108	40.7190027	-73.9973094	\N	148	\N	Mulberry Street	Caffè Palermo	\N	\N	10013	\N	\N	\N	\N	\N	\N
1521	8151656730	40.7171319	-73.9981749	\N	197	\N	Canal Street	Tiger Sugar	\N	\N	10013	\N	\N	\N	\N	\N	\N
1522	8215586833	40.6866548	-73.9900282	\N	\N	\N	\N	Cafe Volkan	\N	\N	\N	\N	\N	\N	\N	\N	\N
1523	8220642027	40.7564343	-73.7556644	\N	\N	\N	\N	Science Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1524	8220642029	40.7558425	-73.7565685	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
1525	8238256286	40.7364893	-73.9784178	New York	400	NY	East 23rd st	Starbucks	+1 212-673-4213	\N	10010	\N	\N	\N	\N	\N	\N
1527	8265254785	40.6907261	-73.9916814	Brooklyn	105	NY	Court Street	I''Milky Bubble Tea	\N	\N	11201	\N	\N	\N	\N	\N	\N
1528	8272824072	40.7222054	-73.9821254	New York	226	NY	East 3rd Street	Gaia Italian Cafè	+1-646-350-3977	\N	10009	info@gaiaitaliancafe.com	\N	\N	\N	\N	\N
1529	8284627179	40.7832576	-73.9475535	New York	1834	NY	2nd Avenue	Madame Bonté Café	\N	\N	10128	\N	\N	\N	\N	\N	\N
1530	8284985198	40.6484686	-73.9788506	\N	\N	\N	\N	Steeplechase Coffee	+1-347-799-2640	\N	\N	\N	\N	\N	\N	\N	\N
1531	8289646188	40.7189751	-73.9947937	\N	134	\N	Bowery	Prince Tea House	+1-646-892-3160	\N	10013	\N	\N	\N	\N	\N	\N
1532	8289799740	40.7515183	-73.9949349	Concourse Retail Space	383	NY	West 31st ST	Starbucks	+1 646-385-3293	\N	10001	\N	\N	\N	\N	\N	\N
1533	8289844992	40.7714475	-73.9825405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1534	8307422435	40.6459771	-73.97212	\N	\N	\N	\N	Der Pioneer	+1-347-435-0132	\N	\N	\N	\N	\N	\N	\N	\N
1535	8307757298	40.7727091	-73.9816717	New York	60	NY	West 65th Street	Le Pain Quotidien	+1-212-721-4001	\N	10023	\N	\N	\N	\N	\N	\N
1536	8313701446	40.5812194	-74.1661132	\N	\N	\N	\N	The Sweet Hut	\N	\N	\N	\N	\N	\N	\N	\N	\N
1537	8332419151	40.761568	-73.9242011	Astoria	3207	\N	Broadway	Toast & Roast	(718) 777-0997	\N	11106	\N	\N	\N	\N	\N	\N
1538	8333736504	40.7773359	-73.9615905	\N	1064	\N	Madison Avenue	E.A.T.	+1 212-772-0022; +1 646-358-1120	\N	\N	\N	\N	\N	\N	\N	\N
1539	8333740831	40.717267	-73.9925517	\N	\N	\N	\N	S. Wan Cafe	+1-212-966-8269	\N	\N	\N	\N	\N	\N	\N	\N
1540	8335897915	40.7769144	-73.9214749	\N	\N	\N	21st Street	Kinship Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1541	8379835169	40.603699	-73.995822	Brooklyn	8510	NY	21st Avenue	Prince Tea House	+1-718-975-5077	\N	11214	\N	\N	\N	\N	\N	\N
1542	8392198894	40.7568961	-73.91424	\N	\N	\N	\N	D-Lite Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1543	8392198906	40.7589383	-73.9186347	\N	\N	\N	\N	New York City Bagel Coffee House	\N	\N	\N	\N	\N	\N	\N	\N	\N
1544	8406371483	40.6605904	-73.9609117	\N	546	\N	Flatbush Avenue	Hibiscus Brew	\N	\N	11225	\N	\N	\N	\N	\N	\N
1545	8427233988	40.7780161	-73.978577	New York	274	NY	Columbus Avenue	Black Press Coffee	+1 (646) 490-6499	\N	10023	\N	\N	\N	\N	\N	\N
1546	8455829693	40.7452485	-73.9822953	New York	424	NY	Park Avenue South	Starbucks	+1 212-725-0637	\N	10016	\N	\N	\N	\N	\N	\N
1547	8497761668	40.5755842	-73.9774568	Brooklyn	825	NY	Surf Avenue	Starbucks	+1 347-675-1703	\N	11224	\N	\N	\N	\N	\N	\N
1548	8551295312	40.7594589	-73.9700026	New York	655	NY	Lexington Avenue	Starbucks	+1 212-308-5717	\N	10022	\N	\N	\N	\N	\N	\N
1549	8551468889	40.7567499	-73.9726202	New York	560	NY	Lexington Avenue	Starbucks	+1 212-751-2937	\N	10022	\N	\N	\N	\N	\N	\N
1550	8551468902	40.7522546	-73.9752551	New York	425	NY	Lexington	Starbucks	+1 212-922-3589	\N	10017	\N	\N	\N	\N	\N	\N
1551	8551640071	40.7514356	-73.9764854	\N	\N	\N	\N	Gregorys Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1552	8570222327	40.6843423	-73.97863	Brooklyn	578	NY	Atlantic Avenue	Starbucks	+1-929-367-4549	\N	11217	\N	\N	\N	\N	\N	\N
1553	8622598771	40.7197342	-73.9991471	New York	157	NY	Lafayette	Starbucks	+1 646-838-4269	\N	10013	\N	\N	\N	\N	\N	\N
1554	8631908538	40.6934184	-73.9673028	\N	455A	\N	Myrtle Ave	Peck''s	+1 347-689-4969	\N	\N	\N	\N	\N	\N	\N	\N
1555	8641328556	40.7935231	-73.9705072	New York	723	NY	Amsterdam Avenue	PlantShed New York Flowers	\N	\N	10025	\N	\N	\N	\N	\N	\N
1556	8641328557	40.7941755	-73.9710563	New York	204	NY	West 96th Street	gertrude	\N	\N	10025	\N	\N	\N	\N	\N	\N
1557	8644307517	40.7137611	-74.009094	New York	120	NY	Church Street	Starbucks	+1 212-513-1451	\N	10007	\N	\N	\N	\N	\N	\N
1558	8648214218	40.7211682	-74.0085684	\N	\N	\N	\N	Interlude	\N	\N	\N	\N	\N	\N	\N	\N	\N
1559	8669140491	40.7526793	-73.992874	New York	494	NY	8th Avenue	Starbucks	+1 212-947-3860	0	10001	\N	\N	\N	\N	\N	\N
1560	8669227466	40.7534341	-73.9928127	\N	519	\N	8th Avenue	Essen	+1 212-290-1515	\N	10018	\N	\N	\N	\N	\N	\N
1561	8670146200	40.7579172	-73.9890503	\N	680	\N	8th Avenue	The Times Eatery	\N	\N	10036	\N	\N	\N	\N	\N	\N
1562	8685702116	40.7026414	-73.9012082	Ridgewood	68-38	NY	Forest Avenue	Cafe Plein Air	+1-917-522-6133	\N	11385	\N	\N	\N	\N	\N	\N
1563	8687882712	40.7942067	-73.9724815	New York	2541	\N	Broadway	Charlotte Cafe	+1-347-235-2807	\N	\N	\N	\N	\N	\N	\N	\N
1564	8695143164	40.7368812	-73.9848111	\N	238	\N	3rd Avenue	Eleni''s Goods	+1-646-449-0221	\N	10003	\N	\N	\N	\N	\N	\N
1565	8709392098	40.7853877	-73.9791671	New York	2263	\N	Broadway	Royal Coffee	+1-646-905-8006	\N	10024	\N	\N	\N	\N	\N	\N
1566	8732421661	40.7898312	-73.9482267	New York	129	NY	East 102nd Street	Frenchy Cafe	+1 646-891-0088	\N	10029	info@frenchycoffeenyc.com	\N	\N	\N	\N	\N
1567	8772495902	40.7749318	-73.9480822	\N	1597	\N	York Avenue	Black Star Bakery & Cafe	+1 646-726-4546	\N	10028	\N	\N	\N	\N	\N	\N
1568	8785244239	40.7655854	-73.981766	\N	1758	\N	Broadway	Joe & The Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
1569	8787410948	40.7743106	-73.98082	New York	159	NY	Columbus Avenue	Starbucks	+1 917-764-3602	\N	10023	\N	\N	\N	\N	\N	\N
1570	8787410950	40.7741425	-73.9814385	\N	\N	\N	\N	Le Botaniste	\N	\N	\N	\N	\N	\N	\N	\N	\N
1571	8789533322	40.7524402	-73.9734731	New York	708	NY	3rd Avenue	Little Collins	+1-212-308-1969	\N	10017	\N	\N	\N	\N	\N	\N
1572	8791888444	40.7476872	-73.9864866	\N	17	\N	West 32nd Street	Grace Street	+1 917-745-2125	\N	\N	hello@bygracestreet.com	\N	\N	\N	\N	\N
1573	8792307147	40.7381183	-73.9838989	New York	280	NY	3rd Avenue	Think Coffee	\N	\N	10010	\N	\N	\N	\N	\N	\N
1574	8832734925	40.7092166	-74.0141592	New York	15	NY	Carlisle Street	Starbucks	+1 646-860-8615	\N	10006	\N	\N	\N	\N	\N	\N
1575	8835666276	40.6321426	-73.9504003	\N	\N	\N	\N	Topfer Library Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1576	8851156980	40.719582	-74.0084712	New York	112	NY	Hudson Street	Cafe Atelier	+1-646-895-0133	\N	10013	\N	\N	\N	\N	\N	\N
1577	8861668918	40.7132893	-74.0096484	\N	\N	\N	\N	Salad Box	\N	\N	\N	\N	\N	\N	\N	\N	\N
1578	8872982362	40.7538538	-73.9868085	\N	1412	\N	Broadway	Cook	+1 212-997-7601	\N	10018	\N	\N	\N	\N	\N	\N
1579	8872982377	40.7543258	-73.9871718	New York	1411	NY	Broadway	Starbucks	+1 917-675-2766	\N	10018	\N	\N	\N	\N	\N	\N
1580	8881081277	40.7169447	-73.994646	\N	124	\N	Hester Street	one cup tea	+1 347-845-9760	\N	10002	\N	\N	\N	\N	\N	\N
1581	8883769317	40.7148605	-74.0059829	New York	291	NY	Broadway	Starbucks	+1 212-406-5315	\N	10007	\N	\N	\N	\N	\N	\N
1582	8883795718	40.7160631	-74.0085698	\N	\N	\N	West Broadway	Bluestone Lane	\N	\N	\N	\N	\N	\N	\N	\N	\N
1583	8890918163	40.7535964	-73.9992946	New York	450	NY	West 33rd Street	Starbucks	+1 646-648-3696	\N	10001	\N	\N	\N	\N	\N	\N
1584	8914329517	40.7145719	-74.0171487	\N	\N	\N	\N	Laughing Man	\N	\N	\N	\N	\N	\N	\N	\N	\N
1585	8914342617	40.713932	-74.0164953	\N	\N	\N	\N	Cicci Di Carne	\N	\N	\N	\N	\N	\N	\N	\N	\N
1586	8923548077	40.74042	-73.8793041	Elmhurst	83-28	\N	Broadway	Vivi BubbleTea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1587	8927772748	40.7237188	-73.8501889	Forest Hills	104-20	NY	Queens Boulevard	Parker Pantry	\N	\N	11375	\N	\N	\N	\N	\N	\N
1588	8941943724	40.7684383	-73.9243666	Astoria	25-17	NY	30th Avenue	Sip A Cup	\N	\N	\N	\N	\N	\N	\N	\N	\N
1589	8942090280	40.7619161	-73.9249421	Astoria	31-01	NY	Broadway	Starbucks	+1 718-777-1305	\N	11106	\N	\N	\N	\N	\N	\N
1590	8953971450	40.7483015	-73.9386495	\N	28-10	\N	Jackson Avenue	Sweet Leaf Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1591	8953971452	40.7498284	-73.9414818	\N	\N	\N	\N	Möge tee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1592	8974574626	40.7836736	-73.9523572	\N	1417	\N	Lexington Avenue	Bread N Wine	\N	\N	10128	\N	\N	\N	\N	\N	\N
1593	8988157188	40.6876221	-73.9568049	\N	343	\N	Franklin Avenue	For All Things Good	\N	\N	11216	\N	\N	\N	\N	\N	\N
1594	8990769665	40.7423244	-73.9490982	Long Island City	21-02	NY	49th Avenue	Starbucks	+1 718-786-8881	\N	11101	\N	\N	\N	\N	\N	\N
1595	8996587943	40.7486986	-73.9778705	\N	311	\N	Lexington Avenue	Lucid Cafe	\N	\N	10016	\N	\N	\N	\N	\N	\N
1596	9018179738	40.7302461	-73.9904206	\N	\N	\N	\N	Bluestone Lane	\N	\N	\N	\N	\N	\N	\N	\N	\N
1597	9023025529	40.760239	-73.8265481	\N	\N	\N	\N	Gong Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
1598	9032637735	40.690634	-73.9917389	Brooklyn	111	NY	Court Street	Brain Food	\N	\N	11201	\N	\N	\N	\N	\N	\N
1599	9035676817	40.7476635	-73.9864189	\N	15	\N	West 32nd Street	Tea Makers	\N	\N	10001	\N	\N	\N	\N	\N	\N
1600	9036389122	40.7297115	-73.9909671	\N	\N	\N	\N	Astor Plate	\N	\N	\N	\N	\N	\N	\N	\N	\N
1601	9036389125	40.7282924	-73.9891267	\N	\N	\N	\N	Le Petit Parisien	+1-917-262-0406	\N	\N	\N	\N	\N	\N	\N	\N
1602	9045283641	40.7317675	-74.0064128	\N	\N	\N	\N	Oscar''s Place	\N	\N	\N	\N	\N	\N	\N	\N	\N
1603	9051228617	40.5760866	-73.9715426	Brooklyn	271	NY	Sea Breeze Avenue	Pep Bakehouse and Coffee Shop	+1 929 397 0094	\N	11224	info@pepbakery.com	\N	\N	\N	\N	\N
1604	9051241922	40.7124741	-73.9605821	Brooklyn	743	NY	Driggs Avenue	Ceremonia Bakeshop	+1 (347) 384-2212	\N	11211	\N	\N	\N	\N	\N	\N
1605	9051252639	40.7118326	-73.9647216	Brooklyn	95	NY	South 5th Street	Butler	\N	\N	11249	\N	\N	\N	\N	\N	\N
1606	9064064217	40.7234822	-73.9886664	New York	72	\N	East 1st Street	The Lazy Llama Coffee Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1607	9075295302	40.7656124	-73.9570688	\N	404	\N	East 69th Street	Yia Yia''s Homemade Greek Food	+1 212-452-1210	\N	10021	info@yiayiasnyc.com	\N	yiayiashomemadegreekfood	\N	\N	\N
1608	9088344065	40.7306929	-73.9858959	New York	184	NY	2nd Avenue	Tompkins Square Bagels	+1-917-472-7639	\N	10003	\N	\N	\N	\N	\N	\N
1609	9098890025	40.768414	-73.9588952	\N	1353	\N	2nd Avenue	Matto Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
1610	9104671450	40.7443565	-73.9542634	Long Island City	5-43	NY	48th Avenue	Little Chef Little Café	+1-845-310-4255	\N	11101	info@littlecheflittlecafe.com	\N	\N	\N	\N	\N
1611	9121440014	40.7363882	-73.9585835	\N	\N	\N	\N	Eleva	\N	\N	\N	\N	\N	\N	\N	\N	\N
1612	9122915888	40.6807429	-73.996853	\N	\N	\N	\N	Local Roots	+1-718-210-5593	\N	\N	\N	\N	\N	\N	\N	\N
1613	9123117118	40.6945558	-73.9939731	Brooklyn	134	NY	Montague Street	Starbucks	+1 718-243-0455	\N	11201	\N	\N	\N	\N	\N	\N
1614	9132786081	40.5849963	-73.9511193	\N	\N	\N	\N	Orso	\N	\N	\N	\N	\N	\N	\N	\N	\N
1615	9140312166	40.6821216	-73.9497801	\N	449	\N	Nostrand Avenue	Bunny	\N	\N	11216	\N	\N	\N	\N	\N	\N
1616	9140312169	40.6834333	-73.9437692	\N	\N	\N	\N	Brown Butter	\N	\N	\N	\N	\N	\N	\N	\N	\N
1617	9140429121	40.6770202	-73.9591329	\N	\N	\N	\N	Pour Quality	\N	\N	\N	\N	\N	\N	\N	\N	\N
1618	9140832070	40.7420578	-73.9894927	\N	\N	\N	\N	Eataly	\N	\N	\N	\N	\N	\N	\N	\N	\N
1619	9143230746	40.6209606	-73.9982988	\N	6807	\N	New Utrecht Avenue	Cafe Mocha	\N	\N	\N	\N	\N	\N	\N	\N	\N
1620	9144041599	40.810303	-73.9526624	New York	284	NY	Saint Nicholas Avenue	Starbucks	+1 212-651-9656	\N	10027	\N	\N	\N	\N	\N	\N
1621	9156973277	40.6559314	-74.0064725	Brooklyn	934	NY	3rd Avenue	Cafe Japon	\N	\N	11232	\N	\N	\N	\N	\N	\N
1622	9173283016	40.7742116	-73.9546884	New York	\N	NY	\N	Starbucks	\N	\N	10028	\N	\N	\N	\N	\N	\N
1623	9228265907	40.7507114	-73.9868695	\N	968	\N	6th Avenue	Brasserie Toast Cafe	\N	\N	10018	\N	\N	\N	\N	\N	\N
1624	9241590661	40.7672671	-73.9592472	\N	1324	\N	2nd Avenue	Vivi Bubble Tea	+1-646-858-0710	\N	\N	\N	\N	\N	\N	\N	\N
1625	9247328221	40.6068917	-74.1627912	Staten Island	1700	NY	Richmond Avenue	Tim Hortons	+1 718-370-2555	\N	10314-3932	\N	\N	\N	\N	\N	\N
1626	9272996385	40.7323041	-73.95783	\N	200	\N	Franklin Street	Sippy Cafe	+1-917-909-0662	\N	11222	\N	\N	\N	\N	\N	\N
1627	9273167176	40.7161023	-73.9663432	\N	262	\N	Kent Avenue	Two Hands	+1-917-257-3221	\N	11249	\N	\N	\N	\N	\N	\N
1628	9291191721	40.6682057	-73.9510178	\N	1183	\N	President Street	P-Street Cafe	+1-718-954-1150	\N	11225	\N	\N	\N	\N	\N	\N
1629	9312819779	40.781057	-73.9525772	New York	1592	NY	3rd Avenue	Marathon Coffee	\N	\N	10128	\N	\N	\N	\N	\N	\N
1630	9321723922	40.7671717	-73.9593112	\N	1322	\N	2nd Avenue	le Réveil	\N	\N	\N	\N	\N	\N	\N	\N	\N
1631	9321760830	40.7715895	-73.956552	\N	1465	\N	2nd Avenue	Ella''s Cafe	+1 917-409-0307	\N	\N	\N	\N	\N	\N	\N	\N
1632	9325661457	40.7559346	-73.9942088	\N	\N	\N	\N	Cafe Aroma	\N	\N	\N	\N	\N	\N	\N	\N	\N
1633	9330613472	40.6950814	-73.9948457	Brooklyn	115	NY	Montague Street	L’Appartement 4F	\N	\N	11201	\N	\N	\N	\N	\N	\N
1634	9340215860	40.7181358	-73.9860644	\N	156	\N	Delancey Street	Hawa Smoothies	+1 646-799-9605	\N	\N	\N	\N	hawasmoothies	\N	\N	\N
1635	9348996443	40.7131507	-73.8731553	Middle Village	79-12	NY	Metropolitan Avenue	Caffé Latte	\N	\N	11379	\N	\N	\N	\N	\N	\N
1636	9353480378	40.7205405	-73.9084625	\N	\N	\N	\N	59 Grand Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
1637	9354070817	40.7303819	-73.8873965	Maspeth	74-25	NY	Grand Avenue	Starbucks	+1 718-335-1957	\N	11373	\N	\N	\N	\N	\N	\N
1638	9354070873	40.7277344	-73.8920293	\N	\N	\N	\N	Mimi & Coco	+1-718-606-0101	\N	\N	\N	\N	\N	\N	\N	\N
1639	9356114560	40.6768133	-73.9803621	\N	\N	\N	\N	Grounded Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1640	9371206973	40.7168549	-73.9856403	\N	\N	\N	\N	GrandLo Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1641	9374707265	40.7175729	-73.9880757	\N	\N	\N	\N	Café d''Avignon	\N	\N	\N	\N	\N	\N	\N	\N	\N
1642	9393419568	40.6191734	-73.989937	Brooklyn	6423	NY	18th Avenue	Starbucks	+1 718-234-7160	\N	11204	\N	\N	\N	\N	\N	\N
1643	9403176561	40.6807305	-73.9513739	\N	1251	\N	Fulton Street	Star Cafe & Bakery	+1-718-496-5098	\N	11216	\N	\N	\N	\N	\N	\N
1644	9403176563	40.6806602	-73.9520472	\N	\N	\N	\N	Bagel Nest	+1-718-872-7545	\N	\N	\N	\N	\N	\N	\N	\N
1645	9406270440	40.6859369	-73.9542381	\N	1109	\N	Bedford Avenue	Coffee Uplifits People	\N	\N	11216	\N	\N	\N	\N	\N	\N
1646	9409060624	40.8052243	-73.966289	New York	2869	NY	Broadway	Qahwah House	+1-646-344-1274	\N	10025	\N	\N	\N	\N	\N	\N
1647	9440589127	40.6844658	-73.950244	\N	\N	\N	\N	Madame Poupon	\N	\N	\N	\N	\N	\N	\N	\N	\N
1648	9448907812	40.779167	-73.9560063	New York	1270	NY	Lexington Avenue	Paris Baguette	\N	\N	10028	\N	\N	\N	\N	\N	\N
1649	9481392668	40.7024999	-73.8185258	Richmond Hill	132-40	NY	Metropolitan Avenue	Starbucks	+1 718-262-8691	\N	11418	\N	\N	\N	\N	\N	\N
1650	9497036165	40.7761004	-73.9518782	\N	318	\N	East 84th Street	Madame Bontè Café	+1 917-409-5555	\N	10028	madamebontegarden@gmail.com	\N	\N	\N	\N	\N
1651	9501235662	40.7363076	-73.9554676	\N	\N	\N	\N	For the Record	\N	\N	\N	\N	\N	\N	\N	\N	\N
1652	9501459860	40.7408478	-73.9489553	\N	\N	\N	\N	Coffee Project New York	\N	\N	\N	\N	\N	\N	\N	\N	\N
1653	9501513257	40.6451065	-74.0105193	\N	5002	\N	5th Avenue	ViVi Bubble Tea	\N	\N	11220	\N	\N	\N	\N	\N	\N
1654	9503346182	40.6930741	-73.9713807	\N	\N	\N	\N	Jill Lindsey	+1-347-987-4538	\N	\N	\N	\N	\N	\N	\N	\N
1655	9511990468	40.6880478	-73.9551908	\N	\N	\N	\N	Pilar Cuban Bakery	+1-718-623-2822	\N	\N	\N	\N	\N	\N	\N	\N
1656	9515459915	40.6931395	-73.9732187	\N	\N	\N	\N	Locals	+1-718-222-9992	\N	\N	\N	\N	\N	\N	\N	\N
1657	9517546194	40.7424296	-73.8546689	\N	53-06	\N	108th Street	Corona Café	+1 347-476-4980	\N	\N	\N	\N	\N	\N	\N	\N
1658	9528305921	40.693533	-73.992074	\N	\N	\N	\N	Sippy Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1659	9543748330	40.6609899	-73.9533535	\N	\N	\N	\N	Hamlet	\N	\N	\N	\N	\N	\N	\N	\N	\N
1660	9543860017	40.8149807	-73.9443109	\N	\N	\N	\N	PROOF Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1661	9543863717	40.8041731	-73.9541227	\N	235	\N	West 116th Street	BO''s Bagels	\N	\N	10026	\N	\N	\N	\N	\N	\N
1662	9543871617	40.7675057	-73.9931234	New York	750	NY	11th Avenue	Afficionado Coffee Roasters	+1-914-482-1521	\N	10019	\N	\N	\N	\N	\N	\N
1663	9543885217	40.7303032	-73.9839567	\N	345	\N	East 12th Street	Saltwater Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
1664	9543892117	40.7293995	-73.9868476	\N	\N	\N	\N	La Cabra	\N	\N	\N	\N	\N	\N	\N	\N	\N
1665	9543899217	40.7332768	-74.0061716	\N	\N	\N	\N	Blackstone Coffee Roaster	\N	\N	\N	\N	\N	\N	\N	\N	\N
1667	9543917517	40.7025899	-73.9941507	Brooklyn	20	NY	Old Fulton Street	% Arabica	+1-718-865-2551	\N	11201	\N	\N	\N	\N	\N	\N
1668	9543937717	40.7401553	-73.9283362	\N	\N	\N	\N	Birch Coffee HQ	\N	\N	\N	\N	\N	\N	\N	\N	\N
1669	9543939117	40.6983917	-73.9370493	\N	\N	\N	\N	Drip	\N	\N	\N	\N	\N	\N	\N	\N	\N
1670	9543939118	40.7107068	-73.9512259	\N	349	\N	Union Avenue	Palona Cafe & Bakery	\N	\N	11211	\N	\N	\N	\N	\N	\N
1671	9543940517	40.7145938	-73.9450381	\N	\N	\N	\N	Hungry Ghost Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1672	9543941517	40.7194959	-73.96067	\N	\N	\N	\N	Alex Coffee Roasters Brooklyn	\N	\N	\N	\N	\N	\N	\N	\N	\N
1673	9546428495	40.7373761	-73.7782358	\N	195-9	\N	69th Avenue	Meadows Cafe	+1-929-499-3559	\N	11365	\N	\N	\N	\N	\N	\N
1674	9550708171	40.7400868	-73.9909032	\N	160	\N	5th Avenue	Ralph''s Coffee	+1 212-627-2040	\N	10010	\N	\N	\N	\N	\N	\N
1675	9552593824	40.7297984	-73.9928785	New York	740	NY	Broadway	The Donut Pub	+1 646-974-1221	\N	10003	donutpub@gmail.com	\N	\N	\N	\N	\N
1676	9556844292	40.7608594	-73.997937	New York	555	NY	West 42nd Street	Romeo And Juliet Colombian Coffee	646-707-3789	\N	\N	\N	\N	\N	\N	\N	\N
1677	9559658875	40.7293544	-73.989023	New York	11	NY	Saint Mark''s Place	Beard Papa''s	+1-212-960-8472	\N	10003	\N	\N	\N	\N	\N	\N
1678	9566829986	40.7290595	-73.9884404	New York	27	NY	Saint Mark''s Place	N25 Nitro Tea & Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
1679	9571769981	40.7762901	-73.9542806	\N	226	\N	East 83rd Street	Cafè Blériot	\N	\N	10028	\N	\N	\N	\N	\N	\N
1680	9579314646	40.7329596	-73.9859835	New York	227	NY	East 14th Street	MooMooCha	\N	\N	10003	\N	\N	\N	\N	\N	\N
1681	9579377217	40.7316535	-73.9880652	New York	83	NY	3rd Avenue	Sammy L Coffee	+1-917-770-4047	\N	10003	\N	\N	\N	\N	\N	\N
1682	9581958450	40.7977141	-73.9343965	\N	2137	\N	1st Avenue	Evelyn''s Kitchen	+1 646-476-7906	\N	10035	\N	\N	\N	\N	\N	\N
1683	9583638725	40.690448	-73.9518833	\N	90	\N	Kosciuszko Street	Burly Coffee	\N	\N	11205	\N	\N	\N	\N	\N	\N
1684	9583789837	40.6938515	-73.9614424	\N	\N	\N	\N	TB Coffee House	\N	\N	\N	\N	\N	\N	\N	\N	\N
1685	9583805196	40.6938331	-73.963668	\N	\N	\N	\N	OJBK Tea Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
1686	9586083804	40.7639375	-73.9667072	New York	801	NY	Lexington Avenue	Joe & The Juice	\N	\N	10065	\N	\N	\N	\N	\N	\N
1687	9586659413	40.7651701	-73.9657768	\N	156	\N	East 64th Street	Alice''s Tea Cup	+1 212-486-9200	\N	10065	\N	\N	\N	\N	\N	\N
1688	9590309771	40.7870041	-73.9540362	New York	50	NY	East 96th Street	Grabstein''s Bagels	\N	\N	10128	\N	\N	\N	\N	\N	\N
1689	9595950539	40.7081895	-73.9202089	\N	321	\N	Starr Street	Kings Kolache	\N	\N	11237	\N	\N	\N	\N	\N	\N
1690	9596938816	40.7809445	-73.954711	\N	1324	\N	Lexington Avenue	Tal Bagels	+1 646-850-0133	\N	\N	\N	\N	\N	\N	\N	\N
1691	9601671752	40.5778339	-73.9612102	Brooklyn	607	NY	Brighton Beach Avenue	Starbucks	+1 718-934-3211	\N	11235	\N	\N	\N	\N	\N	\N
1692	9621859854	40.6886993	-73.947421	\N	\N	\N	\N	Little Roy	\N	\N	\N	\N	\N	\N	\N	\N	\N
1693	9622073541	40.6924466	-73.9430775	\N	\N	\N	\N	Petisco Brazuca	\N	\N	\N	\N	\N	\N	\N	\N	\N
1694	9624402289	40.6894044	-73.9705995	\N	\N	\N	\N	Nostrand Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1695	9624789645	40.7179646	-73.9566853	\N	\N	\N	\N	SF BK	\N	\N	\N	\N	\N	\N	\N	\N	\N
1696	9630440537	40.7210014	-73.9911028	\N	\N	\N	\N	The Hideout Chai Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1697	9633471059	40.8167277	-73.9585099	New York	611	NY	West 129th Street	Dear Mama	+1-716-727-2854	\N	10027	\N	\N	\N	\N	\N	\N
1698	9644541103	40.7479431	-73.987102	\N	33	\N	West 32nd Street	Machi machi	\N	\N	10001	\N	\N	\N	\N	\N	\N
1699	9652667817	40.7052164	-74.0091284	\N	5	\N	Hanover Street	The Little Beet	\N	\N	\N	\N	\N	\N	\N	\N	\N
1700	9658251141	40.7525226	-73.9924763	New York	260	NY	West 35th Street	Liberty Bagels Midtown	+12122791124	\N	10001	\N	\N	\N	\N	\N	\N
1701	9658579984	40.7600469	-73.8327001	Flushing	38-02	NY	Prince Street	The Alley	\N	\N	11354	\N	\N	\N	\N	\N	\N
1702	9659096580	40.7545045	-73.998504	\N	\N	\N	\N	Old Country Coffee	+1-646-861-2171	\N	\N	\N	\N	\N	\N	\N	\N
1703	9661358859	40.7266373	-73.991949	\N	\N	\N	\N	Kettl	+1-646-590-0479	\N	\N	\N	\N	\N	\N	\N	\N
1704	9661358860	40.7266017	-73.9919637	\N	\N	\N	\N	Current Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1705	9661877493	40.6396937	-73.9674191	Brooklyn	1112	NY	Cortelyou Road	Blue Star Parlor	(347) 365-9035	\N	11218	\N	\N	\N	\N	\N	\N
1706	9664668087	40.7687226	-73.7921822	Flushing	32-02	NY	Francis Lewis Boulevard	Starbucks	+1 718-888-7737	\N	11358	\N	\N	\N	\N	\N	\N
1707	9666095412	40.6389617	-73.9195495	Brooklyn	1556	NY	Ralph Avenue	NY Tracks Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1708	9671008994	40.7603503	-73.829261	Flushing	136-28	NY	39th Avenue	Mango Mango	\N	\N	11355	\N	\N	\N	\N	\N	\N
1709	9671893394	40.7390365	-73.9203347	\N	48-09	\N	45th Street	Dolci Paradise Bakery	+1 718-937-3410	\N	11377	\N	\N	\N	\N	\N	\N
1710	9678976667	40.6913614	-73.866156	Woodhaven	75-08	NY	Jamaica Avenue	Pop Pot Noodle & Tea Spot	+1-718-296-2172	\N	11421	\N	\N	\N	\N	\N	\N
1711	9683497137	40.7771173	-73.9525218	\N	1631	\N	2nd Avenue	Caroline''s Donuts	\N	\N	\N	\N	\N	\N	\N	\N	\N
1712	9690757656	40.7747408	-73.9506866	\N	1592	\N	1st Avenue	Le Pain Quotidien	+1 646-681-3110	\N	10028	\N	\N	\N	\N	\N	\N
1713	9696507316	40.7033542	-73.986766	\N	52	\N	Jay Street	Fuel Fever	+1-929-298-0323	\N	11201	\N	\N	\N	\N	\N	\N
1714	9699175979	40.7591032	-73.9918725	\N	\N	\N	\N	Rind	\N	\N	\N	\N	\N	\N	\N	\N	\N
1715	9705479179	40.7595166	-73.920585	Astoria	3702	NY	Broadway	La Casa Del Sabor	\N	\N	\N	\N	\N	\N	\N	\N	\N
1716	9707608778	40.7405219	-73.9225659	Sunnyside	42-14	NY	Greenpoint Avenue	Full Moon Cafe	+1 929-522-0944	\N	11377	\N	\N	\N	\N	\N	\N
1717	9709878987	40.5902134	-74.0884316	Staten Island	1562	NY	Hylan Boulevard	Tim Hortons	+1 718-980-0091	\N	10305	\N	\N	\N	\N	\N	\N
1718	9711419117	40.709544	-74.0085841	\N	\N	\N	\N	Healthy Green Juice Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1719	9715980449	40.7162197	-73.9895853	New York	39	NY	Essex Street	Flower''s Cafe	+1 2123900630	\N	10002	\N	\N	\N	\N	\N	\N
1720	9717340504	40.7156154	-73.9902595	New York	46	NY	Hester Street	Meow Parlour	\N	\N	10002	\N	\N	\N	\N	\N	\N
1721	9735398744	40.7146689	-73.9981529	\N	\N	\N	\N	Art Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
1722	9736192080	40.5789775	-73.9760326	Brooklyn	626	NY	Sheepshead Bay Road	Georgian Corner	+1 347-240-0940	\N	11224	georgiancorner2022@gmail.com	\N	\N	\N	\N	\N
1723	9742033446	40.7208138	-73.8468607	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1724	9758458699	40.6199686	-73.9070033	Brooklyn	7112	NY	Avenue U	Bergen Beach Cafe	+1 718-444-9473;+1 718-241-1891	\N	11234	\N	\N	\N	\N	\N	\N
1725	9762844875	40.6449048	-74.0242528	\N	140	\N	58th Street	Pete''s Brooklyn Eats Cafe	\N	\N	11220	\N	\N	\N	\N	\N	\N
1726	9770640988	40.7755074	-73.9536926	\N	1585	\N	2nd Avenue	Bonjour Crepes & Waffles	\N	\N	\N	\N	\N	\N	\N	\N	\N
1727	9777821013	40.6231911	-74.0313616	Brooklyn	8610	NY	3rd Avenue	Pegasus	+1-718-748-6977	\N	11209	\N	\N	\N	\N	\N	\N
1728	9779751521	40.6364476	-74.0259492	\N	\N	\N	\N	Bai’ Dar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1729	9779884981	40.6347668	-74.026616	\N	\N	\N	\N	Take Away & Cafe	+1-718-680-0777	\N	\N	\N	\N	\N	\N	\N	\N
1730	9784340519	40.7624715	-73.9811369	\N	152	\N	West 52nd Street	Partners Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1731	9784352417	40.759942	-73.9816372	\N	\N	\N	\N	Le Caffe Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1732	9784361517	40.7575756	-73.9790831	\N	12	\N	West 48th Street	Maman	\N	\N	10036	\N	\N	\N	\N	\N	\N
1733	9787132471	40.6508486	-74.0117396	\N	\N	\N	\N	C-Xique Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1734	9795586991	40.6988698	-73.992494	\N	70	\N	Henry Street	Amai Bā	\N	\N	11201	\N	\N	\N	\N	\N	\N
1735	9806919511	40.7436657	-73.9738384	New York	591	NY	1st Avenue	Starbucks	+1 347-852-0545	\N	10016	\N	\N	\N	\N	\N	\N
1736	9808520836	40.6938125	-73.9828875	\N	\N	\N	\N	Compilation Coffee	+1-347-422-0271	\N	\N	\N	\N	\N	\N	\N	\N
1737	9809871507	40.589945	-73.9728274	Brooklyn	274	NY	Avenue X	Jezero Cafe	+1 917-933-4064	\N	11223	\N	\N	\N	\N	\N	\N
1738	9812993600	40.701665	-73.9865228	\N	105	\N	York Street	Devocion	+1-718-285-6180	\N	11201	\N	\N	\N	\N	\N	\N
1739	9826455127	40.7180009	-73.9989068	New York	121	NY	Baxter Street	Sponges Cafe	\N	\N	10013	\N	\N	\N	\N	\N	\N
1740	9826455128	40.7179543	-73.9991906	New York	118	NY	Baxter Street	Kam Hing Coffee Shop	\N	\N	10013	\N	\N	\N	\N	\N	\N
1741	9828589992	40.6939965	-74.0005421	\N	159	\N	Bridge Park Drive	Ebb & Flow Bakery	\N	\N	11201	\N	\N	\N	\N	\N	\N
1742	9834107259	40.6337862	-74.0214569	\N	\N	\N	\N	Coconut Hookah	\N	\N	\N	\N	\N	\N	\N	\N	\N
1743	9834107264	40.6327857	-74.0211173	\N	6927	\N	5th Avenue	Hemo Cafe	+1-718-333-5130	\N	11209	\N	\N	\N	\N	\N	\N
1744	9834254267	40.638502	-74.016977	\N	6115	\N	5th Avenue	Panaderia Melissa	+1-718-492-4002	\N	11220	\N	\N	\N	\N	\N	\N
1745	9834265123	40.7754055	-73.8719708	\N	\N	\N	\N	Sweetleaf Coffee Roasters	\N	\N	\N	\N	\N	\N	\N	\N	\N
1746	9842564518	40.6866724	-73.9777301	\N	\N	\N	\N	BAMcafé	+1-718-636-4100	\N	\N	\N	\N	\N	\N	\N	\N
1747	9845209353	40.6044692	-73.9976959	Brooklyn	\N	NY	86th Street	Moge Tee	\N	\N	11214	\N	\N	\N	\N	\N	\N
1748	9845250397	40.6026278	-73.9953132	Brooklyn	2134	NY	86th Street	Tiger Sugar	\N	\N	11214	\N	\N	\N	\N	\N	\N
1749	9845278413	40.6049946	-73.9985584	Brooklyn	1971	NY	86th Street	Starbucks	+1 718-266-1503	\N	11214	\N	\N	\N	\N	\N	\N
1750	9858858654	40.5768186	-73.9659384	Brooklyn	239	NY	Brighton Beach Avenue	Güllüoglu Baklava	+1-347-577-6150	\N	11235	\N	\N	\N	\N	\N	\N
1751	9858858655	40.5767921	-73.9660844	Brooklyn	231	NY	Brighton Beach Avenue	Kaffeine 231	+1-929-437-5697	\N	11235	\N	\N	\N	\N	\N	\N
1752	9859366273	40.7927777	-73.9406366	\N	2128	\N	2nd Avenue	Lamb''s Bread	+1 646-649-3023	\N	10029	order@lambsbreadcafe.com	\N	\N	\N	\N	\N
1753	9862528717	40.6916182	-73.9306515	\N	71	\N	Malcolm X Boulevard	Space 71x Cafe	3475337533	\N	11221	\N	\N	\N	\N	\N	\N
1754	9874879428	40.7173256	-73.9944535	\N	\N	\N	\N	\N	+1-212-219-0981	\N	\N	\N	\N	\N	\N	\N	\N
1755	9875326357	40.7798658	-73.9507315	\N	254	\N	East 89th Street	Kafe Neo	\N	\N	\N	\N	\N	\N	\N	\N	\N
1756	9875403134	40.7291644	-73.9899477	\N	69	\N	Cooper Square	Möge Tee	+1-929-350-2833	\N	10003	\N	\N	\N	\N	\N	\N
1757	9879092110	40.5864094	-73.8158431	\N	92-06	\N	Rockaway Beach Boulevard	Rockaway Roasters	+1 718 474 2500	\N	\N	\N	\N	\N	\N	\N	\N
1758	9879124792	40.6892365	-74.0184224	\N	\N	\N	\N	Joe Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1759	9890344448	40.7506032	-73.9713921	\N	\N	\N	\N	Remi43 Flower & Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1760	9907916717	40.7224988	-73.7962487	Jamaica	8000	NY	Utopia Parkway	Starbucks	+1 718-990-1716	\N	11432	\N	\N	\N	\N	\N	\N
1761	9915437745	40.7532096	-73.9983386	New York	438	NY	West 33rd Street	Black Fox Coffee Co.	\N	\N	10001	\N	\N	\N	\N	\N	\N
1762	9939526744	40.6221092	-74.1685284	Staten Island	700	NY	South Avenue	Tim Hortons	+1 718-982-9203	\N	10303	\N	\N	\N	\N	\N	\N
1763	9962140857	40.6827643	-73.9641104	\N	920A	\N	Fulton Street	Otway Bakery	\N	\N	11238	\N	\N	\N	\N	\N	\N
1764	9964704539	40.6977235	-73.9709547	\N	146	\N	Flushing Avenue	Head Hi	+1-917-909-0005	\N	11205	\N	\N	\N	\N	\N	\N
1765	9978637390	40.7262473	-73.9911911	\N	\N	\N	\N	Three Jewels	+1-646-964 5736	\N	\N	\N	\N	\N	\N	\N	\N
1766	10000660266	40.7514513	-73.9955788	\N	\N	\N	\N	Blue Bottle Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1767	10024111241	40.6992617	-73.9128696	\N	1524	\N	Myrtle Avenue	L''imprimerie	\N	\N	11237	\N	\N	\N	\N	\N	\N
1768	10047602537	40.6840079	-73.9296241	\N	616	\N	Halsey Street	Trash Island	\N	\N	\N	\N	\N	\N	\N	\N	\N
1769	10064144417	40.7225249	-73.9974462	New York	67	NY	Spring Street	Joe & The Juice	\N	\N	10012	\N	\N	\N	\N	\N	\N
1770	10065571478	40.6836278	-73.9263876	\N	210	\N	Patchen Avenue	Early Yves	\N	\N	\N	\N	\N	\N	\N	\N	\N
1771	10078555417	40.7192029	-73.9597158	Brooklyn	103	NY	North 7th Street	Angels Cafe	\N	\N	11249	\N	\N	\N	\N	\N	\N
1772	10087482396	40.7663723	-73.9796629	New York	922	NY	7th Avenue	Serafina	\N	\N	10019	\N	\N	\N	\N	\N	\N
1773	10089925944	40.5267073	-74.2015551	Staten Island	5801	NY	Amboy Road	Starbucks	+1 718-559-4012	\N	10309	\N	\N	\N	\N	\N	\N
1774	10090538383	40.7211027	-74.0039693	\N	\N	\N	\N	Matchaful	\N	\N	\N	\N	\N	\N	\N	\N	\N
1775	10096054217	40.7600809	-73.9921104	\N	\N	\N	\N	Frisson Espresso 44	(646) 398-8210	\N	\N	\N	\N	\N	\N	\N	\N
1776	10103143985	40.7212565	-73.8519263	Queens	68-04	NY	Burns Street	Forest Cafe	\N	\N	11375	\N	\N	\N	\N	\N	\N
1777	10112378651	40.6935927	-73.9858169	\N	\N	\N	\N	Blank Street Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1778	10136292572	40.5828543	-73.954431	Brooklyn	2	NY	Neptune Avenue	The Bay Cafe	+1 347-554-8811	\N	11235	\N	\N	\N	\N	\N	\N
1779	10145183255	40.7351387	-73.9794032	\N	\N	\N	\N	Rosemary''s Pantry	\N	\N	\N	\N	\N	\N	\N	\N	\N
1780	10148136558	40.6736727	-73.9606526	\N	\N	\N	\N	Polly''s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1781	10155740444	40.6837163	-73.9350613	\N	347	\N	Lewis Avenue	Secret Garden	\N	\N	\N	\N	\N	\N	\N	\N	\N
1782	10160790949	40.7859285	-73.9847142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1783	10162028274	40.6326133	-74.0274968	\N	\N	\N	\N	Crepe Factory	\N	\N	\N	\N	\N	\N	\N	\N	\N
1784	10170251962	40.7371151	-73.9587661	\N	\N	\N	\N	Pueblo Querido	\N	\N	\N	\N	\N	\N	\N	\N	\N
1785	10178410745	40.6759277	-73.9302979	\N	\N	\N	\N	Almah Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1786	10179234747	40.7830092	-73.951819	New York	163	NY	East 92nd Street	La Librairie des Enfants Café	\N	\N	10128	\N	\N	\N	\N	\N	\N
1787	10195939217	40.5714143	-74.1112551	\N	\N	\N	\N	Vivi Bubble Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1788	10195939281	40.5718176	-74.1129822	\N	286	\N	New Dorp Lane	Hidden Cottage Coffee	+1-	\N	10306	\N	\N	\N	\N	\N	\N
1789	10195939293	40.5714094	-74.1117674	\N	\N	\N	\N	Chun Yang Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1790	10195939473	40.8066718	-73.9539564	\N	2213	\N	Frederick Douglass Boulevard	Ganache Coffee	\N	\N	10026	\N	\N	\N	\N	\N	\N
1791	10198298532	40.6493711	-74.0092386	Brooklyn	4415	NY	4th Avenue	Yafa Cafe	+1-347-464-3999	\N	11220	hello@yafabrooklyn.com	\N	\N	\N	\N	\N
1792	10198368953	40.6342742	-74.023884	\N	\N	\N	\N	Albait Baitak Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1793	10203189775	40.6332495	-74.0272357	\N	\N	\N	\N	Cream Coffee Shop	+1-718-333-5288	\N	\N	\N	\N	\N	\N	\N	\N
1794	10208288369	40.5953581	-73.9540725	\N	1601	\N	Gravesend Neck Road	Pep Bakehouse & Coffee Shop	+1 347-462-2703	\N	\N	\N	\N	\N	\N	\N	\N
1795	10210135802	40.6771638	-74.0129064	\N	\N	\N	\N	Fort Defiance General Store	+1-347-457-5082	\N	\N	\N	\N	\N	\N	\N	\N
1796	10215152666	40.7606653	-73.9786542	New York	1290	NY	6th Avenue	Starbucks	+1 212-977-4861	\N	10104	\N	\N	\N	\N	\N	\N
1797	10224616957	40.7312238	-73.9860512	New York	139	NY	2nd Avenue	Plantshed	\N	\N	10003	\N	\N	\N	\N	\N	\N
1798	10234443658	40.7503456	-73.9404398	\N	25-08	\N	Queens Plaza South	Gong Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
1799	10236311997	40.5765137	-73.9675314	\N	123	\N	Brighton Beach Avenue	Pavlova Bakery	+1 347-374-2480	\N	11235	\N	\N	\N	\N	\N	\N
1800	10236618684	40.7418157	-73.8785865	Elmhurst	86-12	NY	Whitney Avenue	Yaya Tea	\N	\N	11373	\N	\N	\N	\N	\N	\N
1801	10245411701	40.6475701	-74.0075462	Brooklyn	\N	NY	5th Avenue	Totopan	\N	\N	11220	\N	\N	\N	\N	\N	\N
1802	10245668521	40.6351912	-74.0201287	\N	\N	\N	\N	Haveli Lounge	+1-347-497-5204	\N	\N	\N	\N	\N	\N	\N	\N
1803	10245833835	40.7193032	-73.8428059	\N	71-60	\N	Austin Street	Red Piper	+1 718 635 0245	\N	\N	\N	\N	\N	\N	\N	\N
1804	10248075953	40.6817281	-73.9289848	\N	324	\N	Malcolm X Boulevard	Bailey’s Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1805	10248988534	40.6588298	-73.9962617	\N	755	\N	5th Avenue	Baked in Brooklyn	+1-718-788-3164	\N	11232	\N	\N	\N	\N	\N	\N
1806	10270349361	40.7202909	-73.9931406	\N	\N	\N	\N	Ceci Cela Patisserie	\N	\N	\N	\N	\N	\N	\N	\N	\N
1807	10270349365	40.7185168	-73.9938501	\N	\N	\N	\N	Cafecito	9296687080	\N	10002	\N	\N	\N	\N	\N	\N
1808	10281405382	40.7117738	-74.0116689	\N	\N	\N	\N	Épicerie Boulud	+2125959605	\N	\N	\N	\N	\N	\N	\N	\N
1809	10282968181	40.6836366	-73.9681287	\N	810	\N	Fulton Street	Hungry Ghost Coffee	\N	\N	11238	\N	\N	\N	\N	\N	\N
1810	10293858669	40.6517223	-73.9756829	\N	1293	\N	Prospect Avenue	Tea Time Tactics	\N	\N	11218	\N	\N	\N	\N	\N	\N
1811	10295601809	40.5718028	-74.1456619	\N	\N	\N	\N	Main Street Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1812	10301379609	40.7328798	-74.0038211	\N	\N	\N	\N	Hungry Ghost Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1813	10309927350	40.7701027	-73.9918251	New York	829	NY	11th Avenue	White Noise Coffee Co.	+1-646-596-0022	\N	10019	\N	\N	\N	\N	\N	\N
1814	10311562060	40.7209649	-73.8440907	Forest Hills	107-28	NY	71st Avenue	Gregory’s Coffee	\N	\N	11375	\N	\N	\N	\N	\N	\N
1815	10311585044	40.7712328	-73.9930809	\N	\N	\N	\N	Le Cafe Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1816	10315606384	40.6605665	-73.9604844	\N	547	\N	Flatbush Avenue	High Grade Coffee	\N	\N	11225	\N	\N	\N	\N	\N	\N
1817	10315606401	40.6585929	-73.9603145	\N	605	\N	Flatbush Avenue	Brooklyn Perk	\N	\N	11225	\N	\N	\N	\N	\N	\N
1818	10553751065	40.6550606	-73.9609978	\N	206	\N	Parkside Avenue	Brooklyn Perk	\N	\N	11226	\N	\N	\N	\N	\N	\N
1819	10557706111	40.7302525	-73.9598036	\N	\N	\N	\N	Rhythm Zero	\N	\N	\N	\N	\N	\N	\N	\N	\N
1820	10568524391	40.6868109	-73.9594329	\N	\N	\N	\N	Commune	\N	\N	\N	\N	\N	\N	\N	\N	\N
1821	10572082255	40.6551412	-73.9615614	\N	\N	\N	\N	Loud Baby	\N	\N	\N	\N	\N	\N	\N	\N	\N
1822	10577727225	40.7151665	-73.9128882	\N	\N	\N	\N	La Lampara Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1823	10584741959	40.7177951	-73.9949335	\N	\N	\N	\N	New Kamboat Bakery & Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1824	10584741960	40.7183685	-73.9941338	\N	\N	\N	\N	Daronghua Bakery	+1-212-941-1924	\N	\N	\N	\N	\N	\N	\N	\N
1825	10584741963	40.7184114	-73.994286	\N	\N	\N	\N	I''Milky	\N	\N	\N	\N	\N	\N	\N	\N	\N
1826	10592171291	40.7404973	-73.9816996	New York	351	NY	3rd Avenue	Matto Espresso	\N	\N	10010	\N	\N	\N	\N	\N	\N
1827	10595013925	40.6844938	-73.9440073	\N	\N	\N	\N	Bklyn Kettle Cafe	+1-718-676-5154	\N	\N	\N	\N	\N	\N	\N	\N
1828	10611597220	40.6379186	-73.8961722	\N	\N	\N	\N	Bagels & Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1829	10613041697	40.717779	-73.9543949	Brooklyn	221	NY	North 9th Street	pinkFROG Cafe	(929) 265-3350	\N	11211	\N	\N	\N	\N	\N	\N
1830	10616783226	40.7518188	-73.9815906	New York	455	NY	5th Avenue	The Library Café by Amy''s Bread	\N	\N	10018	\N	\N	\N	\N	\N	\N
1831	10642744091	40.6815777	-73.9533915	\N	\N	\N	\N	Seed Brklyn Green House	\N	\N	\N	\N	\N	\N	\N	\N	\N
1832	10651869821	40.6919072	-73.9828819	\N	136	\N	Willoughby Street	Gong Cha	+1-917-909-1207	\N	11201	\N	\N	\N	\N	\N	\N
1833	10661660092	40.720871	-73.8463425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1834	10679436534	40.7199493	-73.8433764	\N	\N	\N	\N	Coffee Shot	\N	\N	\N	\N	\N	\N	\N	\N	\N
1835	10679766624	40.6220455	-74.0320421	\N	276	\N	88th Street	Coffee Rx	\N	\N	11209	\N	\N	\N	\N	\N	\N
1836	10684451345	40.7660888	-73.7893409	\N	34-01	\N	Francis Lewis Boulevard	Annie''s Social	\N	\N	11358	\N	\N	\N	\N	\N	\N
1837	10689045274	40.7084835	-74.0135243	\N	\N	\N	\N	Dragon Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1838	10689197471	40.7328775	-73.9877118	New York	110	NY	3rd Avenue	Matto Espresso	\N	\N	10003	\N	\N	\N	\N	\N	\N
1839	10692993581	40.7271351	-73.9795427	New York	167	NY	Avenue B	Hekate Café & Elixir Lounge	\N	\N	10009	\N	\N	\N	\N	\N	\N
1840	10693681226	40.7496503	-73.9479257	\N	\N	\N	\N	The Local Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1841	10693681228	40.7494889	-73.9499484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1842	10695150094	40.6914599	-73.982586	\N	\N	\N	\N	Cafe d''Avignon	\N	\N	\N	\N	\N	\N	\N	\N	\N
1843	10695864090	40.7374343	-73.9903996	New York	861	NY	Broadway	Venchi	\N	\N	10003	\N	\N	\N	\N	\N	\N
1844	10696133542	40.7400773	-73.989726	New York	921	NY	Broadway	Le Pain Quotidien	+1-332-910-6833	\N	10003	\N	\N	\N	\N	\N	\N
1845	10697603105	40.7381907	-73.9983412	\N	\N	\N	\N	Modern Bread and Bagel	\N	\N	\N	\N	\N	\N	\N	\N	\N
1846	10698237278	40.7071344	-73.8545979	Forest Hills	8989	NY	Union Turnpike	Starbucks	+1 718-846-2310	\N	11375	\N	\N	\N	\N	\N	\N
1847	10699487852	40.7500086	-73.9486443	\N	\N	\N	\N	Ninth Street Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
1848	10703267650	40.7479155	-73.9422563	Long Island City	43-21	NY	Hunter Street	Teazzi Tea Shop	+1-347-554-2680	\N	11101	\N	\N	\N	\N	\N	\N
1849	10712959086	40.6404442	-74.0153799	\N	\N	\N	\N	Generoso''s	+1-718-492-0895	\N	\N	\N	\N	\N	\N	\N	\N
1850	10717839775	40.7325497	-73.9967931	\N	\N	\N	\N	Marlton Esprsso Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1851	10717839800	40.7332791	-73.9985251	\N	\N	\N	\N	Moshava Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1852	10732832182	40.7575663	-73.8345632	Skyview Center	40-24	NY	College Point Boulevard	Starbucks	+1 347-756-1663	\N	11354	\N	\N	\N	\N	\N	\N
1853	10733191689	40.7567525	-73.8354882	\N	\N	\N	\N	CoCo Fresh Tea & Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
1854	10733191693	40.7567627	-73.8356531	\N	\N	\N	\N	Gong Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
1855	10751283105	40.7748669	-73.9542775	New York	247	NY	East 81st Street	Hutch and Waldo	\N	\N	10028	\N	\N	\N	\N	\N	\N
1856	10751724805	40.7730659	-73.9910076	New York	235	NY	Freedom Place South	Harry''s Table by Cipriani	+1 212-339-2015	\N	10069	\N	\N	\N	\N	\N	\N
1857	10755612112	40.7755174	-73.9566349	\N	1424	\N	3rd Avenue	Maman	\N	\N	10028	\N	\N	\N	\N	\N	\N
1858	10756703060	40.7189289	-73.9948154	New York	132	NY	Bowery	Matcha Cafe Maiko	+1-646-379-8778	\N	10013	\N	\N	\N	\N	\N	\N
1859	10759352794	40.6290677	-74.0740103	\N	\N	\N	\N	Americano Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1860	10767181157	40.5494366	-74.2211548	\N	\N	\N	\N	Bloomin'' Bean	\N	\N	\N	\N	\N	\N	\N	\N	\N
1861	10769253446	40.7296098	-73.9963468	New York	45	NY	West 4th Street	Starbucks	\N	\N	10012	\N	\N	\N	\N	\N	\N
1862	10771770502	40.6335595	-74.0214744	\N	\N	\N	\N	Meena House Cafe	+1-718-238-3274	\N	\N	\N	\N	\N	\N	\N	\N
1863	10776441923	40.7402204	-73.8745297	Queens	48-36	NY	90th Street	Little Starry Cafe	\N	\N	11373	\N	\N	\N	\N	\N	\N
1864	10776706633	40.6964711	-73.9003685	\N	10-80	\N	Cypress Avenue	Käfē Bar & Bistro	\N	\N	\N	\N	\N	\N	\N	\N	\N
1865	10780593448	40.7207251	-73.904318	Maspeth	60-94	NY	Flushing Avenue	Bake A Bagel	+1-718-326-2197	\N	11378	\N	\N	\N	\N	\N	\N
1866	10797237705	40.7449381	-73.9831337	New York	450	NY	Park Avenue South	Felix Roasting Co.	\N	\N	10016	\N	\N	\N	\N	\N	\N
1867	10797371352	40.6302512	-74.0219084	\N	\N	\N	\N	MEDD	+1-917-478-2131	\N	\N	\N	\N	\N	\N	\N	\N
1868	10797403545	40.6299775	-74.0222584	\N	\N	\N	\N	Cup of Joe	+1-718-921-1000	\N	\N	\N	\N	\N	\N	\N	\N
1869	10798119179	40.8137808	-73.9557256	New York	1351	NY	Amsterdam Avenue	Plowshares Coffee Roasters	+1 212 222 0280	\N	10027	\N	\N	\N	\N	\N	\N
1870	10803207999	40.6907104	-73.9364312	\N	173	\N	Lewis Avenue	Botani	\N	\N	11221	\N	\N	\N	\N	\N	\N
1871	10814741993	40.6916761	-73.9091787	\N	\N	\N	\N	General Irving	\N	\N	\N	\N	\N	\N	\N	\N	\N
1872	10817203424	40.7607909	-73.9911391	New York	653	NY	9th Avenue	Jooy Tea Shoppe	+1 646-692-4229	\N	10036	\N	\N	\N	\N	\N	\N
1873	10822653418	40.6283942	-74.0232641	\N	\N	\N	\N	Asal Yemen	+1-347-560-6329	\N	\N	\N	\N	\N	\N	\N	\N
1874	10822789007	40.7168388	-73.944581	\N	402	\N	Graham Avenue	Land to Sea	\N	\N	\N	\N	\N	\N	\N	\N	\N
1875	10828734042	40.748382	-73.9878429	New York	49	NY	West 32nd Street	Early Edition Espresso Bar	\N	\N	10001	\N	\N	\N	\N	\N	\N
1876	10828749043	40.7154382	-73.9982044	New York	67	NY	Bayard Street	Yi Fang Tea	\N	\N	10013	\N	\N	\N	\N	\N	\N
1877	10830968028	40.7260837	-74.001279	New York	161	NY	Prince Street	Joe & The Juice	+1-212-777-0034	\N	10012	\N	\N	\N	\N	\N	\N
1878	10833095528	40.7404072	-74.0050369	New York	678	NY	Hudson Street	Starbucks	+1 646-634-9309	\N	10014	\N	\N	\N	\N	\N	\N
1879	10835856480	40.7175808	-73.9590156	Brooklyn	142	NY	North 6th Street	I''Milky	+1-585-421-7795	\N	11249	\N	\N	\N	\N	\N	\N
1880	10836191952	40.7164698	-73.9590218	Brooklyn	219	NY	Bedford Avenue	Lattente	\N	\N	11211	\N	\N	\N	\N	\N	\N
1881	10838005576	40.714913	-73.9627684	Brooklyn	255	NY	Berry Street	Caffe Valencia	+1-718-869-4459	\N	11249	\N	\N	\N	\N	\N	\N
1882	10838647152	40.7142602	-73.9613129	Brooklyn	277	NY	Bedford Avenue	Blank Street Coffee	\N	\N	11211	\N	\N	\N	\N	\N	\N
1883	10844410470	40.7850355	-73.951709	\N	1466	\N	Lexington Avenue	Matto Espresso	+1 347-882-8000	\N	\N	\N	\N	\N	\N	\N	\N
1884	10844530005	40.7515977	-73.9806682	\N	\N	\N	\N	Gregory’s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1885	10845028784	40.7705406	-73.7358693	\N	252-29	\N	Northern Boulevard	Bean & Bean Coffee	+1-347-235-0534	\N	11363	\N	\N	\N	\N	\N	\N
1886	10865913691	40.7116246	-73.9425422	\N	766	\N	Grand Street	Brooklyn Standard	\N	\N	\N	\N	\N	\N	\N	\N	\N
1887	10884425202	40.7538903	-73.9961681	\N	441	\N	9th Avenue	In Common NYC Cafe	+16463703099	\N	\N	\N	\N	\N	\N	\N	\N
1888	10885430068	40.671056	-73.9424343	\N	1090	\N	Saint Johns Place	Daughter	\N	\N	11213	\N	\N	\N	\N	\N	\N
1889	10900189251	40.5749761	-73.9666271	\N	201	\N	Brighton 1st Road	Anyway Beach Cafe	+1 718-569-5195	\N	\N	\N	\N	\N	\N	\N	\N
1890	10903431383	40.6449025	-74.074711	Staten Island	55	NY	Richmond Terrace	Starbucks	+1 718-720-1130	\N	10302	\N	\N	\N	\N	\N	\N
1891	10903431384	40.6449517	-74.0748106	\N	\N	\N	\N	Bake Culture	\N	\N	\N	\N	\N	\N	\N	\N	\N
1892	10906413973	40.7026356	-74.0117836	New York	1	NY	New York Plaza	Starbucks	+1 212-785-8409	\N	10004	\N	\N	\N	\N	underground	\N
1893	10908633305	40.7579767	-73.9694536	\N	880	\N	\N	Gregory’s coffee	\N	\N	10022	\N	\N	\N	\N	\N	\N
1894	10908635405	40.7282617	-74.0051457	\N	\N	\N	\N	Gregory’s coffee	\N	\N	10014	\N	\N	\N	\N	\N	\N
1895	10911526106	40.7477192	-73.989028	\N	874	\N	West 31st Street	Gregory’s coffee	\N	\N	10001	\N	\N	\N	\N	\N	\N
1896	10916272079	40.726051	-73.9409223	Brooklyn	269	NY	Nassau Avenue	The Coffee Shop	\N	\N	11222	\N	\N	\N	\N	\N	\N
1897	10923174175	40.7338591	-73.9896639	\N	145	\N	4th Avenue	Le Café Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
1898	10923249690	40.7319019	-73.9863128	\N	\N	\N	\N	Butterdose	\N	\N	\N	\N	\N	\N	\N	\N	\N
1899	10936887405	40.773514	-73.9639139	New York	945	NY	Madison Avenue	The SisterYard	\N	\N	10021	\N	\N	\N	\N	\N	\N
1900	10937301892	40.7577913	-73.804202	\N	43-29	\N	162nd Street	The Well Coffee	+1-718-939-3605	\N	\N	info@thewellcoffeeny.com	\N	\N	\N	\N	\N
1901	10943139481	40.7803207	-73.7767272	Bayside	23-88	NY	Bell Boulevard	Starbucks	+1 718-352-0590	\N	11360	\N	\N	\N	\N	\N	\N
1902	10963340357	40.7510055	-73.9951268	\N	\N	\N	\N	Birch Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1903	10965288117	40.6789046	-73.9974077	\N	\N	\N	\N	Noire	\N	\N	\N	\N	\N	\N	\N	\N	\N
1904	10968363058	40.7460415	-73.890507	\N	40-36	\N	75th Street	Bobba Hubba	+1 212-365-8269	\N	\N	\N	\N	\N	\N	\N	\N
1905	10978640780	40.6754219	-74.0004929	\N	\N	\N	\N	Los Hermanos Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1906	10979262390	40.7197286	-73.9960952	\N	\N	\N	\N	Two Hands	\N	\N	\N	\N	\N	\N	\N	\N	\N
1907	10979262392	40.719466	-73.996191	\N	\N	\N	\N	The Chai Spot	+1-646-678-5868	\N	\N	\N	\N	\N	\N	\N	\N
1908	10982264361	40.7638169	-73.9646685	\N	\N	\N	\N	Black Press Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1909	10982272193	40.7585176	-73.9629994	\N	1045	\N	1st Avenue	Frolla Cafè	+1 917-409-0208	\N	\N	\N	\N	\N	\N	\N	\N
1910	10982394762	40.7270841	-73.976867	\N	\N	\N	\N	Borris & Horton	\N	\N	\N	\N	\N	\N	\N	\N	\N
1911	10982600248	40.7685162	-73.9552447	\N	1370	\N	1st Avenue	B&B Bagels	+1 917-262-0878	\N	10021	\N	\N	\N	\N	\N	\N
1912	10983296546	40.7024968	-73.9862589	Brooklyn	181	NY	Front Street	Beepublic	\N	\N	11201	\N	\N	\N	\N	\N	\N
1913	10989822650	40.6689883	-73.94208	\N	\N	\N	\N	Chocolate Espresso Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
1914	10993142705	40.8551748	-73.9377338	\N	213	\N	Pinehurst Avenue	Buunni	\N	\N	10033	\N	\N	\N	\N	\N	\N
1915	10995386324	40.7531828	-74.0017525	\N	\N	\N	\N	Blue Bottle Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1916	10997993461	40.681556	-73.9656692	\N	847	\N	Atlantic Avenue	Burley Coffee	\N	\N	11238	\N	\N	\N	\N	\N	\N
1917	11003172111	40.675276	-73.9747025	\N	\N	\N	\N	Brooklyn High Low	+1-646-907-9467	\N	\N	\N	\N	\N	\N	\N	\N
1918	11005811332	40.7839974	-73.9779504	New York	420	NY	Amsterdam Avenue	Black Lab Cafe	+16463434089	\N	10024	\N	\N	\N	\N	\N	\N
1919	11008681025	40.6270458	-74.0238142	\N	\N	\N	\N	Sheba Hookah Lounge	+1-585-456-0973	\N	\N	\N	\N	\N	\N	\N	\N
1920	11020006881	40.6656295	-73.9714371	Brooklyn	40	NY	West Drive	Winner in the Park	\N	\N	11215	winnerinthepark@winner.nyc	\N	\N	\N	\N	\N
1921	11021066798	40.7019379	-73.8823699	\N	69-11	NY	Myrtle Avenue	Russo''s Pane & Cafe	\N	\N	11385	\N	\N	\N	\N	\N	\N
1922	11030368694	40.5769318	-73.9801202	Brooklyn	2896	NY	West 12th Street	Café Dacha	+1-347-240-7362	\N	11224	\N	\N	\N	\N	\N	\N
1923	11031452795	40.7055551	-74.0039605	New York	84	NY	South Street	Loco Coco	+12122226300	\N	10038	\N	\N	\N	\N	\N	\N
1924	11036322282	40.6322171	-73.9671576	Brooklyn	1015	NY	Foster Avenue	Gong Cha	+1-917-974-7247	\N	11230	\N	\N	\N	\N	\N	\N
1925	11040468156	40.6102813	-74.0631483	\N	\N	\N	\N	Bella Beans Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
1926	11040468182	40.6139871	-74.0658714	\N	\N	\N	\N	Bloom Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1927	11045286604	40.7453194	-73.9795124	\N	\N	\N	\N	Arvaci Ciffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1928	11046991906	40.7345114	-74.0006277	New York	138	NY	West 10th Street	Jack''s Stir Brew Coffee	+1-212-929-0821	\N	10014	\N	\N	\N	\N	\N	\N
1929	11048022206	40.75534	-73.9909383	\N	600	\N	8th Avenue	Berlina Café	+16467999525	\N	10018	\N	\N	\N	\N	\N	\N
1930	11048648635	40.7264448	-74.0020207	\N	\N	\N	\N	Blank Slate	\N	\N	\N	\N	\N	\N	\N	\N	\N
1931	11051498568	40.7597563	-73.9881924	\N	\N	\N	\N	Bistro 46	\N	\N	\N	\N	\N	\N	\N	\N	\N
1932	11053440186	40.75598	-73.9703646	New York	831	NY	Third Avenue	Ess-a-Bagel	+1-212-980-1010	\N	10022	\N	\N	\N	\N	\N	\N
1933	11055876400	40.7663841	-73.9884166	\N	\N	\N	\N	Cafe 424	\N	\N	\N	\N	\N	\N	\N	\N	\N
1934	11062705505	40.735914	-74.0016986	\N	174	\N	7th Avenue South	Fellini Coffee	\N	\N	10014	\N	\N	\N	\N	\N	\N
1935	11063656405	40.7161786	-73.9970795	\N	26B	\N	\N	Chun Yang Tea	\N	\N	10013	\N	\N	\N	\N	\N	\N
1936	11070228708	40.6105097	-74.1472112	Staten Island	2525	NY	Victory Boulevard	Tim Hortons	+1 718-698-6437	\N	10314-6613	\N	\N	\N	\N	\N	\N
1937	11073244128	40.6849219	-73.9814597	\N	\N	\N	\N	IXV	\N	\N	\N	\N	\N	\N	\N	\N	\N
1938	11076895105	40.7615722	-73.983214	\N	762	\N	7th Avenue	Gregory’s coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1939	11078875248	40.7409445	-73.9762081	\N	\N	\N	\N	Platinum Plus Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1940	11079620505	40.6445197	-73.9999603	Brooklyn	4321	NY	8th Avenue	FillUp Coffee	\N	\N	11232	\N	\N	\N	\N	\N	\N
1941	11084168882	40.7092141	-74.0088431	\N	\N	\N	\N	Simpl Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
1942	11085058403	40.7741135	-73.9593294	\N	1121	\N	Lexington Avenue	Angelina Paris	+1 646-454-1418	\N	10075	\N	\N	\N	\N	\N	\N
1943	11085646550	40.6859132	-73.9231462	\N	\N	\N	\N	One Two One Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1944	11091901376	40.5877321	-73.9551165	\N	\N	\N	\N	Tete A Tete	\N	\N	\N	\N	\N	\N	\N	\N	\N
1945	11092315005	40.7644229	-73.9746	\N	\N	\N	\N	Palm Court	\N	\N	\N	\N	\N	\N	\N	\N	\N
1946	11092322205	40.7631731	-73.9733016	\N	\N	\N	\N	Tea room at BG	\N	\N	\N	\N	\N	\N	\N	\N	\N
1947	11093309492	40.7661833	-73.962362	\N	210	\N	East 67th Street 	Padoca Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
1948	11094243741	40.7062991	-74.0033886	\N	\N	\N	\N	Cafe @ McNally Jackson Seaport	\N	\N	\N	\N	\N	\N	\N	\N	\N
1949	11098842088	40.7273122	-73.9842529	New York	103	NY	Saint Marks Place	Ănjelly	6464389224	\N	10009	\N	\N	\N	\N	\N	\N
1950	11105960681	40.728556	-73.9879209	\N	131	\N	2nd Avenue	Poetica Coffee	\N	\N	10003	\N	\N	\N	\N	\N	\N
1951	11117405861	40.6471963	-73.7909034	\N	\N	\N	\N	Mezze Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1952	11119847161	40.7096711	-74.0087599	New York	24	NY	John Street	Tutto Calcio Espresso Bar	+1-212-389-0254	\N	10038	\N	\N	\N	\N	\N	\N
1953	11119879312	40.7094844	-74.008186	\N	\N	\N	\N	Matto Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
1954	11120996769	40.7107591	-73.9088746	Ridgewood	451	NY	Grandview Avenue	Iddy’s Bubble Tea	\N	\N	11385	\N	\N	\N	\N	\N	\N
1955	11123639305	40.7264761	-74.0020131	\N	\N	\N	\N	Blank Street Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1956	11133182357	40.6896675	-73.9777652	Brooklyn	118	NY	DeKalb Avenue	Text Book	+1-347-844-9123	\N	11217	\N	\N	\N	\N	\N	\N
1957	11139705084	40.7082077	-73.8976444	Ridgewood	66-27	NY	Fresh Pond Road	Mr. Wish	+1-646-663-1563	\N	11385	\N	\N	\N	\N	\N	\N
1958	11146056163	40.6776538	-74.0128121	\N	\N	\N	\N	Sowa	\N	\N	\N	\N	\N	\N	\N	\N	\N
1959	11152084762	40.6847907	-73.9775039	Brooklyn	139	NY	Flatbush Avenue	Starbucks	+1 718-789-3418	\N	11217	\N	\N	\N	\N	\N	\N
1960	11153420446	40.7563121	-73.9997868	New York	\N	NY	\N	Paradis in the Park	+16467588580	\N	10018	\N	\N	\N	\N	\N	\N
1961	11154832263	40.7782804	-73.982317	\N	\N	\N	\N	Gong Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
1962	11157639203	40.7356628	-74.0003498	New York	48	NY	Greenwich Avenue	Nadas Colombian Rainbow Empanadas	\N	\N	10011	\N	\N	\N	\N	\N	\N
1963	11157794983	40.7517217	-73.987791	New York	1359	NY	Broadway, Suites 106	Starbucks	+1 929-924-5003	\N	10018	\N	\N	\N	\N	\N	\N
1964	11157819678	40.7578118	-73.9758282	New York	444	NY	Madison	Starbucks	+1 212-644-9462	\N	10022	\N	\N	\N	\N	\N	\N
1965	11159676323	40.7075238	-74.0110938	\N	\N	\N	\N	Tenthousand Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1966	11161553273	40.7724997	-73.9558893	\N	\N	\N	2nd Avenue	Tozzo	\N	\N	\N	\N	\N	\N	\N	\N	\N
1967	11162257422	40.7007283	-73.9112011	Brooklyn	1597	NY	Gates Avenue	New World Nutrition	\N	\N	11237	\N	\N	\N	\N	\N	\N
1968	11163442791	40.7489327	-73.8471999	\N	\N	\N	\N	Dobel Tequila Club	\N	\N	\N	\N	\N	\N	\N	\N	\N
1969	11164227707	40.7164928	-73.9598142	Brooklyn	131	NY	North 4th Street	Copper Mug Coffee	+1-631-536-5209	\N	11249	coppermugcoffee@gmail.com	\N	\N	\N	\N	\N
1970	11165813305	40.6860834	-73.944307	\N	\N	\N	\N	Daughter Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1971	11168061506	40.6771335	-74.0134786	\N	\N	\N	\N	Somtum Der	\N	\N	\N	\N	\N	\N	\N	\N	\N
1972	11170363349	40.7835933	-73.979832	New York	2218	NY	Broadway	Züri Coffee	\N	\N	10024	\N	\N	\N	\N	\N	\N
1973	11170866945	40.7492428	-73.8450337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1974	11170970980	40.846339	-73.7859764	Bronx	274	NY	City Island Avenue	Clipper Coffee	\N	\N	10461	\N	\N	\N	\N	\N	\N
1975	11172400856	40.7065445	-74.0112372	\N	22	\N	Broad Street	Blue Bottle Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1976	11175680754	40.7142671	-74.008695	\N	\N	\N	\N	Birch Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1977	11188992731	40.7061571	-74.0056905	New York	155	NY	Water Street	Starbucks	+1 212-480-3970	\N	10038	\N	\N	\N	\N	\N	\N
1978	11193936084	40.7631111	-73.9591348	\N	1198	\N	1st Avenue	Da Adriano	\N	\N	\N	\N	\N	\N	\N	\N	\N
1979	11196521509	40.7225587	-73.9884993	\N	\N	\N	\N	Beloved Café & Resto	\N	\N	\N	\N	\N	\N	\N	\N	\N
1980	11197809340	40.848325	-73.9309817	New York	2440	NY	Amsterdam Avenue	Milo Coffee Shop	+1 917-261-4750	\N	10033	\N	\N	\N	\N	\N	\N
1981	11223060596	40.7080354	-74.0105959	\N	\N	\N	\N	Ashby''s	\N	\N	\N	\N	\N	\N	\N	\N	\N
1982	11236742641	40.7819547	-73.9759526	New York	102	NY	West 79th Street	Green Park Deli & Pizza	+1-212-724-5425	\N	10024	\N	\N	\N	\N	\N	\N
1983	11240481215	40.6987921	-73.91743	Brooklyn	1432	NY	Myrtle Avenue	Matto Espresso	\N	\N	11237	\N	\N	\N	\N	\N	\N
1984	11258767163	40.7163547	-74.0098581	\N	\N	\N	\N	Jack''s Stir Brew Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1985	11258782637	40.7151337	-74.0081532	\N	107	\N	Chambers Street	Chun Yang	\N	\N	10013	\N	\N	\N	\N	\N	\N
1986	11265041506	40.7439012	-73.9275242	Long Island City	37-10	NY	Queens Boulevard	Vivi Bubble Tea	\N	\N	11101	\N	\N	\N	\N	\N	\N
1987	11276029551	40.738909	-73.7916695	\N	\N	\N	\N	CoCo Fresh Tea & Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
1988	11276029552	40.7387039	-73.7918375	\N	\N	\N	\N	Möge Tee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1989	11281910248	40.7801272	-73.9553231	\N	1280	\N	Lexington Avenue	Ole & Steen	\N	\N	10028	\N	\N	\N	\N	\N	\N
1990	11289970313	40.7534347	-73.9340652	\N	\N	\N	\N	Artpresso Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
1991	11293002345	40.7289586	-73.7808335	\N	80-13	\N	188th Street	Breeza Cafe Restaurant	\N	\N	\N	\N	\N	\N	\N	\N	\N
1992	11293916629	40.7375531	-73.7953825	Fresh Meadows	17312	NY	Horace Harding Expressway	Tim Hortons	+1 347-542-3494	\N	11365	\N	\N	\N	\N	\N	\N
1993	11308423815	40.7498599	-73.9874941	New York	53	NY	West 34th Street	Capital One Café	\N	\N	10001	\N	\N	\N	\N	\N	\N
1994	11309501243	40.7543433	-74.0022171	New York	34	NY	Hudson Yards	Starbucks	+1 917-764-2042	\N	10001	\N	\N	\N	\N	\N	\N
1995	11310320970	40.7033537	-73.908869	Ridgewood	660	NY	Seneca Avenue	NY Nutrition	+1-917-420-2548	\N	11385	\N	\N	\N	\N	\N	\N
1996	11329721731	40.7175462	-74.0104404	\N	\N	\N	\N	Cafe Clementine	\N	\N	\N	\N	\N	\N	\N	\N	\N
1997	11331402045	40.7630341	-73.9786396	\N	\N	\N	\N	Blue Bottle Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
1998	11342362811	40.7350547	-74.0058686	\N	550	\N	Hudson Street	Cafe Kitsune	\N	\N	\N	\N	\N	\N	\N	\N	\N
1999	11345445432	40.7351382	-73.8201617	\N	\N	\N	\N	Science Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2000	11350370353	40.7015101	-73.9032604	Ridgewood	866	NY	Onderdonk Avenue	Cholita Coffee	\N	\N	11385	\N	\N	\N	\N	\N	\N
2001	11372544124	40.7385793	-73.7927653	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2002	11374517233	40.7207982	-73.9965628	\N	180	\N	Mulberry Street	Empanadas Soho	+1 914-602-0527	\N	10012	empanadassoho@gmail.com	\N	\N	\N	\N	\N
2003	11386500757	40.7300314	-73.986353	\N	\N	\N	\N	Hokkaido Baked Cheese Tart	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004	11396442169	40.6936478	-73.9290485	\N	\N	\N	\N	Lalin''s	\N	\N	11221	\N	\N	\N	\N	\N	\N
2005	11396534364	40.7430803	-73.8257302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2006	11396534365	40.7471608	-73.8257641	Flushing	56-45	NY	Main Street	Starbucks	+1 917-578-9150	\N	11355	\N	\N	\N	\N	\N	\N
2007	11399352938	40.7525257	-73.9897468	\N	\N	\N	\N	Song Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2008	11399352953	40.754545	-73.9882746	\N	\N	\N	\N	Frame Gourmet Eatery	\N	\N	\N	\N	\N	\N	\N	\N	\N
2009	11399352960	40.7542503	-73.9878848	\N	\N	\N	\N	Gregory''s Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2010	11399352963	40.7536851	-73.9884107	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2011	11399352965	40.7532206	-73.9887428	\N	\N	\N	\N	Café Hestia	\N	\N	\N	\N	\N	\N	\N	\N	\N
2012	11399454039	40.7003629	-73.9884217	\N	\N	\N	\N	Wonder Beach Café	+1929-969-7607	\N	\N	\N	\N	\N	\N	\N	\N
2013	11404191035	40.7801055	-73.950358	\N	1729	\N	2nd Avenue	Crumbly Cafe & Bakery	+1 917-388-3009	\N	\N	\N	\N	\N	\N	\N	\N
2014	11405963743	40.7663194	-73.9562871	\N	\N	\N	\N	Matto	\N	\N	\N	\N	\N	\N	\N	\N	\N
2015	11406616606	40.7360963	-73.8197378	\N	\N	\N	\N	Library Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2016	11408018369	40.7599122	-73.9912526	\N	\N	\N	\N	Gregory’s	\N	\N	10036	\N	\N	\N	\N	\N	\N
2017	11411008768	40.7981602	-73.9695635	NewYork	2661	NY	Broadway	Zelma''s Caffe	+1-646-370-3851	\N	10025	\N	\N	\N	\N	\N	\N
2018	11411443529	40.8031476	-73.9677965	New York	2801	NY	Broadway	Omonia Cafe	+1-212-246-4050	\N	10025	\N	\N	\N	\N	\N	\N
2019	11413866658	40.8014469	-73.964743	New York	971	NY	Amsterdam Avenue	Möge Tee	\N	\N	10025	\N	\N	\N	\N	\N	\N
2020	11413869531	40.8015058	-73.9644654	New York	196	NY	West 108th Street	Super Nice Coffee and Bakery	+1-332-257-8886	\N	10025	\N	\N	\N	\N	\N	\N
2021	11418235696	40.7539389	-73.9887119	\N	\N	\N	\N	Italian Trattoria	\N	\N	\N	\N	\N	\N	\N	\N	\N
2022	11422171427	40.7400209	-73.7884478	\N	\N	\N	\N	Sunshine Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2023	11441007599	40.7248407	-73.9970753	\N	588	\N	Broadway	Mangia	+1-212-644-0422	\N	10012	\N	\N	\N	\N	\N	\N
2024	11445034900	40.7151538	-74.0056897	New York	299	NY	Broadway	Matto Espresso	\N	\N	10007	\N	\N	\N	\N	\N	\N
2025	11450728435	40.7830689	-73.9511138	\N	1654	\N	3rd Avenue	Increpeable	\N	\N	\N	\N	\N	\N	\N	\N	\N
2026	11463577700	40.7451231	-73.9783379	\N	491	\N	3rd Avenue	Gold Coffee	\N	\N	10016	\N	\N	\N	\N	\N	\N
2027	11477076134	40.791758	-73.9742519	New York	2461	NY	Broadway	Blank Street Coffee	\N	\N	10025	\N	\N	\N	\N	\N	\N
2028	11479001393	40.7800682	-73.9802923	\N	\N	\N	\N	Frame	\N	\N	\N	\N	\N	\N	\N	\N	\N
2029	11479001567	40.7813256	-73.9794012	\N	\N	\N	\N	Joe & The Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
2030	11480683218	40.6341571	-74.0222618	\N	\N	\N	\N	Eden Hookah	+1-929-382-1856	\N	\N	\N	\N	\N	\N	\N	\N
2031	11480683224	40.6346131	-74.020719	\N	\N	\N	\N	The Ocky Way Chocolate Factory	+1-347-560-6080	\N	\N	\N	\N	\N	\N	\N	\N
2032	11501454972	40.7752137	-73.9115497	Astoria	22-37	NY	31st Street	Qahwah House	\N	\N	11105	\N	\N	\N	\N	\N	\N
2033	11505171169	40.7537445	-73.982553	New York	\N	NY	West 42nd Street	Bryant Park Café	+1-212-840-6500	\N	10018	\N	\N	\N	\N	\N	\N
2034	11505171269	40.7182769	-73.9927278	New York	100	NY	Forsyth Street	Kodawari	\N	\N	10002	hello@kodawarinyc.com	\N	\N	\N	\N	\N
2035	11505342959	40.7485722	-73.7561874	Oakland Gardens	61-15	NY	Springfield Boulevard	Anda Boba Tea	\N	\N	11364	\N	\N	\N	\N	\N	\N
2036	11517456127	40.8012634	-73.9593439	New York	321	NY	Cathedral Parkway	Mom''s Food Market	+1-646-964-4527	\N	10026	\N	\N	\N	\N	\N	\N
2037	11517472730	40.8008299	-73.9575911	New York	285	NY	West 110th Street	Purple Waves	+1-212-927-1101	\N	10026	\N	\N	\N	\N	\N	\N
2038	11521280861	40.7915836	-73.9736788	New York	2460	NY	Broadway	Joe & The Juice	\N	\N	10025	\N	\N	\N	\N	\N	\N
2039	11528502978	40.6101536	-73.9554705	Brooklyn	1803	NY	Kings Highway	Safir Bakery & Cafe	\N	\N	11229	\N	\N	\N	\N	\N	\N
2040	11536106180	40.754069	-73.9849241	New York	1073	NY	6th Avenue	Cafe Zaiya	\N	\N	10018	\N	\N	\N	\N	\N	\N
2041	11545491005	40.798879	-73.9615675	New York	51	NY	West 106th Street	MACC Deli	+1-646-756-4299	\N	10025	\N	\N	\N	\N	\N	\N
2042	11557681070	40.7538106	-73.9690686	New York	906	NY	2nd Avenue	Remi Flower & Coffee	+1-646-559-1233	\N	10017	\N	\N	\N	\N	\N	\N
2043	11581113373	40.7392725	-73.7898063	Fresh Meadows	61-15	NY	184th Street	First Fitness Cafe	\N	\N	11365	\N	\N	\N	\N	\N	\N
2044	11583127566	40.5786383	-73.8496794	\N	\N	\N	\N	Panino Rustico/Baya Bar	+1-718-210-2220	\N	\N	\N	\N	\N	\N	\N	\N
2045	11583940162	40.7834343	-73.9794572	New York	224	NY	West 79th Street	Irving Farm Coffee Roasters	\N	\N	10024	\N	\N	\N	\N	\N	\N
2046	11584626923	40.7794718	-73.9832116	New York	245	NY	West 72nd Street	Picky Barista	+1-646-684-3037	\N	10023	\N	\N	\N	\N	\N	\N
2047	11610991069	40.7242387	-73.9961964	New York	284	NY	Lafayette Street	La Cabra	\N	\N	10012	\N	\N	\N	\N	\N	\N
2048	11612945463	40.7899919	-73.9735603	New York	608A	NY	Amsterdam Avenue	Artisan Cafe	\N	\N	10024	\N	\N	\N	\N	\N	\N
2049	11627936545	40.7314777	-73.9942487	New York	37	NY	East 8th Street	Wanpo Tea Shop	\N	\N	10003	\N	\N	\N	\N	\N	\N
2050	11651290841	40.743706	-73.9207774	\N	43-15	\N	Queens Boulevard	Brookside Market	+1 718-806-1902	\N	\N	\N	\N	\N	\N	\N	\N
2051	11653913239	40.7474218	-73.9446673	Long Island City	23-08	NY	44th Drive	Lately Café	\N	\N	11101	lately.cafe@gmail.com	\N	\N	\N	\N	\N
2052	11653922817	40.7340242	-74.0039038	\N	\N	\N	\N	787 Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2053	11654745957	40.7245453	-73.9943619	\N	55	\N	\N	Bagel Boss	+1 646-370-1520	\N	\N	\N	\N	\N	\N	\N	\N
2054	11659815869	40.7109261	-74.0103462	New York	22	NY	Dey Street	Starbucks	+1 212-385-1104	\N	10007	\N	\N	\N	\N	\N	\N
2055	11660428520	40.7424541	-73.9189728	\N	45-22	\N	46th Street	Paris Baguette	+1 718-706-0404	\N	\N	\N	\N	\N	\N	\N	\N
2056	11663984987	40.7151445	-73.9931296	New York	78	NY	Canal Street	Round K by Sol	+1 347-741-1601	\N	10002	\N	\N	\N	\N	\N	\N
2057	11665449521	40.6723872	-73.9926894	Brooklyn	129	NY	9th Street	Principles GI Coffee House	+1-347-218-4290	\N	11215	katie@principlesbk.nyc	\N	\N	\N	\N	\N
2058	11665558672	40.766576	-73.9573829	\N	340	\N	East 70th Street	787 Coffee	+1 917-265-8191	\N	\N	\N	\N	\N	\N	\N	\N
2059	11667208296	40.6250304	-74.1353444	\N	1396B	\N	Forest Avenue	Boba Le Tea Cafe	\N	\N	10302	\N	\N	\N	\N	\N	\N
2060	11667208329	40.6267024	-74.1320679	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2061	11674345072	40.7201134	-73.9988044	New York	177	NY	Lafayette Street	Butler	+1-646-912-9264	\N	10013	\N	\N	\N	\N	\N	\N
2062	11686756833	40.7860838	-73.9779625	New York	2290	NY	Broadway	Westville	+1-212-677-2933	\N	10024	\N	\N	\N	\N	\N	\N
2063	11687176847	40.7833931	-73.9794128	New York	222	NY	West 79th Street	Mochi Dolci & 222 Speakeasy	\N	\N	10024	\N	\N	\N	\N	\N	\N
2064	11704876920	40.7525798	-73.9744452	\N	\N	\N	\N	Madman Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
2065	11717251431	40.7599242	-73.9700459	\N	\N	\N	\N	Café Olympia	\N	\N	\N	\N	\N	\N	\N	\N	\N
2066	11721695351	40.7154052	-73.9443717	Brooklyn	368	NY	Graham Avenue	Variety Cafe	\N	\N	11211	\N	\N	\N	\N	\N	\N
2067	11725744791	40.7233442	-74.0065729	New York	75	NY	Varick Street	drip coffee makers	(917) 704-6742	\N	10013	\N	\N	\N	\N	\N	\N
2068	11725766040	40.7040496	-74.0076741	New York	32	NY	Old Slip Plaza	drip coffee makers	\N	\N	\N	\N	\N	\N	\N	\N	\N
2069	11725779437	40.7256642	-73.9989626	New York	131	NY	Greene Street	Panther Coffee	\N	\N	10012	\N	\N	\N	\N	\N	\N
2070	11729260580	40.7580219	-73.9628824	\N	1042	\N	1st Avenue	Marathon Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2071	11731646617	40.708053	-73.818263	\N	\N	\N	Queens Boulevard	Coffee Cloud	\N	\N	\N	\N	\N	\N	\N	\N	\N
2072	11736720370	40.7631664	-73.972521	\N	16	\N	East 58th Street	Liberty Bagels	\N	\N	10022	\N	\N	\N	\N	\N	\N
2073	11736908591	40.748843	-73.9424279	\N	\N	\N	\N	Vert Frais	\N	\N	\N	\N	\N	\N	\N	\N	\N
2074	11737247196	40.7533337	-73.9401448	\N	40-33	\N	23rd Street	Joe Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2075	11738012197	40.7258776	-74.0036174	\N	\N	\N	\N	Sui Yoga Studio.Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2076	11738266640	40.783395	-73.9799783	New York	2210	NY	Broadway	Brunch	\N	\N	10024	customerservice@brunchbroadway.com	\N	\N	\N	\N	\N
2077	11738335249	40.7810607	-73.976365	New York	370	NY	Columbus Avenue	Chip City	+1-646-649-5714	\N	10024	\N	\N	\N	\N	\N	\N
2078	11739055903	40.7257767	-74.0055352	\N	150	\N	Varick Street	Starbucks	+1 646-230-9816	\N	10013	\N	\N	\N	\N	\N	\N
2079	11739392410	40.7486632	-73.9401364	\N	42-61	\N	Hunter Street	Cuppa Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2080	11739507543	40.7343569	-73.8159887	\N	\N	\N	\N	Avenue C Market Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2081	11739507547	40.7371445	-73.8174058	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2082	11747267935	40.7292851	-73.953737	\N	860	\N	Manhattan Avenue	Upright Coffee	\N	\N	11222	\N	\N	\N	\N	\N	\N
2083	11748255277	40.7643272	-73.9148728	\N	28-54	\N	Steinway Street	Moka & Co	+1 929-666-7002	\N	\N	\N	\N	\N	\N	\N	\N
2084	11748507792	40.850251	-73.9344288	\N	177	\N	Wadsworth Avenue	Espresso Heights	\N	\N	\N	\N	\N	\N	\N	\N	\N
2085	11754487748	40.7054382	-74.0091433	New York	6	NY	Hanover Street	Conwell Coffee Hall	\N	\N	10005	concierge@conwellcoffeehall.com	\N	\N	\N	\N	\N
2086	11761689742	40.7233551	-73.9881657	\N	14	\N	Allen Street	Lucien	\N	\N	\N	\N	\N	\N	\N	\N	\N
2087	11762033170	40.7538905	-73.9850776	\N	1065	\N	6th Avenue	Zucker''s Bagels & Smoked Fish	212-671-2400	\N	\N	\N	\N	\N	\N	\N	\N
2088	11766643572	40.6946861	-73.9934432	\N	\N	\N	\N	Blank Street Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2089	11776251817	40.6178859	-74.03352	\N	\N	\N	\N	Milk & Honey	\N	\N	\N	\N	\N	\N	\N	\N	\N
2090	11777048922	40.7447058	-73.9034401	\N	60-08	\N	Woodside Avenue	moa coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2091	11783969920	40.689538	-73.9851519	\N	217	\N	Livingston Street	Jack''s Stir Brew Coffee	\N	\N	11201	\N	\N	\N	\N	\N	\N
2092	11786190334	40.7520948	-73.7030574	New Hyde Park	271-11	NY	Union Turnpike	YAAAS Tea	+1-718-347-1732	\N	11040	\N	\N	\N	\N	\N	\N
2093	11795951919	40.6328554	-74.0055944	Brooklyn	6001	NY	Fort Hamilton Parkway	Sai Cafe	+1-646-361-1524	\N	11219	\N	\N	\N	\N	\N	\N
2094	11806712843	40.616488	-73.9861326	\N	\N	\N	\N	Caffe Corretto	\N	\N	\N	\N	\N	\N	\N	\N	\N
2095	11817061865	40.7592421	-73.9951614	\N	480	\N	West 42nd Street	SigSpace	\N	\N	10036	\N	\N	\N	\N	\N	\N
2096	11820360453	40.790594	-73.9689247	New York	667	NY	Columbus Avenue	Picky Barista	+1-646-684-3037	\N	10025	\N	\N	\N	\N	\N	\N
2097	11829025830	40.7729377	-73.9143042	\N	23-61	\N	31st Street	Eli’s Cafe & Creperie	\N	\N	\N	\N	\N	\N	\N	\N	\N
2098	11829025834	40.7737349	-73.9141078	\N	\N	\N	31st Street	Under Pressure Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2099	11836256036	40.6187085	-73.9904138	Brooklyn	6517	NY	18th Avenue	ViVi''s Bubble Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2100	11842373514	40.7395346	-74.008533	\N	\N	\N	\N	Frenchette Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
2101	11842400114	40.796445	-73.9348477	New York	2272	NY	1st Avenue	Cassava House	+1-646-928-0219	\N	10035	\N	\N	\N	\N	\N	\N
2102	11854382369	40.7117857	-73.9491299	\N	\N	\N	\N	Olas Coffee Roasters and Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2103	11862536065	40.7458606	-74.0049844	\N	\N	\N	\N	Intelligentsia Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
2104	11864137706	40.605407	-73.997224	Brooklyn	8413	NY	20th Avenue	Yi Fang Tea	\N	\N	11214	\N	\N	\N	\N	\N	\N
2105	11864414861	40.7630907	-73.8144973	Queens	718	NY	Barton Avenue	COFFEE FACTORY	+17189392406	\N	11354	\N	\N	\N	\N	\N	\N
2106	11865385960	40.7268048	-73.9868664	New York	335	NY	East 6th Street	Elsewhere Espresso	\N	\N	10003	\N	\N	\N	\N	\N	\N
2107	11865529110	40.7505083	-73.9933551	New York	\N	NY	\N	Starbucks	+1 646-477-8909	\N	10001	\N	\N	\N	\N	\N	\N
2108	11867354089	40.8996652	-73.8676805	\N	\N	\N	\N	Aroma Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2109	11869258741	40.7403687	-73.8792474	\N	\N	\N	Broadway	Elm Roastery	\N	\N	\N	\N	\N	\N	\N	\N	\N
2110	11872590937	40.7548345	-73.9864878	\N	1450	\N	Broadway	Paris Baguette	+1 516-595-0404	\N	\N	\N	\N	\N	\N	\N	\N
2111	11872851264	40.7545541	-73.9830108	New York	\N	NY	West 42nd Street	Joe & The Juice	\N	\N	\N	\N	\N	\N	\N	\N	\N
2112	11875103936	40.6338591	-73.9638483	\N	1401	\N	Foster Avenue	Sunset Bagels	\N	\N	\N	\N	\N	\N	\N	\N	\N
2113	11875117432	40.6350284	-73.9629475	\N	41B	\N	Newkirk Plaza	Appletree Gourmet	\N	\N	\N	\N	\N	\N	\N	\N	\N
2114	11875174372	40.7541345	-73.9717499	New York	757	NY	Third Avenue	Starbucks	+1 212-715-9884	\N	10017	\N	\N	\N	\N	\N	\N
2115	11879281058	40.7143864	-73.8318857	Kew Gardens	118-24	NY	Queens Boulevard	Starbucks	+1 718-261-4246	\N	11375	\N	\N	\N	\N	\N	\N
2116	11879930429	40.808656	-73.9300156	\N	2430	\N	3rd Avenue	787 Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2117	11885079949	40.7301624	-73.8871138	\N	74-08	\N	Grand Avenue	Siips Boba	\N	\N	\N	\N	\N	\N	\N	\N	\N
2118	11892469640	40.764372	-73.8290101	Flushing	35-20	NY	Leavitt Street	Busy Bee Cafe	\N	\N	11354	\N	\N	\N	\N	\N	\N
2119	11895286667	40.7551309	-73.9923795	\N	315	\N	West 38th Street	Culture Espresso	\N	\N	\N	\N	\N	\N	\N	\N	\N
2120	11896814793	40.6821844	-74.0039128	\N	\N	\N	\N	BORED	\N	\N	\N	\N	\N	\N	\N	\N	\N
2121	11897354380	40.7228856	-74.0045762	\N	\N	\N	\N	Now or Never	\N	\N	\N	\N	\N	\N	\N	\N	\N
2122	11897453324	40.7239804	-73.9801699	\N	\N	\N	\N	Tokuyamatcha Onigirazubar	\N	\N	\N	\N	\N	\N	\N	\N	\N
2123	11907690088	40.6098296	-73.9625378	\N	1942	\N	Coney Island Avenue	Crawford''s Coffee Bar & Cafe	+1 718-998-7002	\N	\N	\N	\N	\N	\N	\N	\N
2124	11910381816	40.7292945	-73.989015	\N	\N	\N	\N	Spot Dessert Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
2125	11919348693	40.6985223	-73.9795751	Brooklyn	3	NY	Flushing Avenue	Starbucks	+1 718-701-3015	\N	11205	\N	\N	\N	\N	\N	\N
2126	11920176973	40.7448142	-73.9486449	\N	13-33	\N	Jackson Avenue	Beanstalk Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2127	11922268886	40.7712562	-73.9082317	\N	\N	\N	\N	The Corner Spot	\N	\N	\N	\N	\N	\N	\N	\N	\N
2128	11936665542	40.7454693	-73.9030755	\N	61-12	\N	Roosevelt Avenue	Dunkin	\N	\N	\N	\N	\N	\N	\N	\N	\N
2129	11939429373	40.7336811	-74.0042611	New York	337	NY	Bleecker Street	Do Not Feed Alligators	\N	\N	10014	\N	\N	\N	\N	\N	\N
2130	11942932648	40.7273382	-73.9900277	\N	\N	\N	\N	Duo	\N	\N	\N	\N	\N	\N	\N	\N	\N
2131	11943712730	40.6945503	-73.9026046	\N	\N	\N	\N	La Raza Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2132	11949550419	40.7880325	-73.9770984	New York	2345	NY	Broadway	Blank Street Coffee	\N	\N	10024	\N	\N	\N	\N	\N	\N
2133	11956309391	40.7148966	-73.9585346	New York	261	\N	Metropolitan Avenue	Butcher‘s Daughter	\N	\N	11211	\N	\N	\N	\N	\N	\N
2134	11958687397	40.7763311	-73.9798016	New York	222	NY	Columbus Avenue	The Muffins Cafe	\N	\N	10023	\N	\N	\N	\N	\N	\N
2135	11961064414	40.7205273	-73.9965666	\N	384	\N	Broome Street	Coffee For Sasquatch	+1-646-861-3829	\N	\N	\N	\N	\N	\N	\N	\N
2136	11963278382	40.7668738	-73.9204798	\N	\N	\N	\N	Cafe to Go	\N	\N	\N	\N	\N	\N	\N	\N	\N
2137	11963599308	40.8429363	-73.9418091	New York	228	NY	Fort Washington Avenue	Prestige Cafe & Deli	\N	\N	10032	\N	\N	\N	\N	\N	\N
2138	11963623561	40.8502767	-73.9365435	New York	714	NY	West 181st Street	Forever Coffee	+1-646-882-0009	\N	10033	\N	\N	\N	\N	\N	\N
2139	11963636514	40.8428438	-73.942848	New York	711	NY	West 168th Street	Barnes & Noble CUIMC Bookstore Cafe	\N	\N	10032	\N	\N	\N	\N	\N	\N
2140	11968161061	40.7538327	-73.9925095	\N	\N	\N	\N	Vanilla Gorilla Cafe	\N	\N	\N	hithere@vanillagorillacafe.com	\N	\N	\N	\N	\N
2141	11968859203	40.7232303	-73.9415595	\N	67	\N	Driggs Avenue	Compass Cafe	+1 718-349-2033	\N	\N	\N	\N	\N	\N	\N	\N
2142	11969362706	40.7356558	-73.9923951	\N	7	\N	East 14th Street	Jooy Tea Shoppe	+1 212-381-6193	\N	\N	\N	\N	\N	\N	\N	\N
2143	11975933909	40.7254716	-73.9447184	\N	\N	\N	\N	Greta	\N	\N	\N	\N	\N	\N	\N	\N	\N
2144	11980017793	40.8102659	-73.9532009	New York	279	NY	Saint Nicholas Avenue	Omega Bakery & Cafe	\N	\N	10027	\N	\N	\N	\N	\N	\N
2145	11993079620	40.7488931	-73.938047	\N	\N	\N	\N	Spot Dessert Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
2146	11993095038	40.6582862	-73.9606336	\N	618	\N	Flatbush Avenue	Red Chaconia Cafe	\N	\N	11225	\N	\N	\N	\N	\N	\N
2147	11994512705	40.7600446	-73.9632883	\N	322	\N	East 59th Street	Greenport Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2148	11994512711	40.759579	-73.9622052	\N	1079	\N	1st Avenue	Tramway Diner	+1 646-922-7980	\N	\N	\N	\N	\N	\N	\N	\N
2149	12013002107	40.5832147	-74.0952223	\N	\N	\N	\N	Alba Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2150	12022987170	40.7497507	-73.8854194	\N	8025	\N	81st Street	Caffé Bene	+17184240768	\N	\N	\N	\N	\N	\N	\N	\N
2151	12024393754	40.7835809	-73.9745307	New York	444	NY	Columbus Avenue	Starbucks	\N	\N	10024	\N	\N	\N	\N	\N	\N
2152	12026550387	40.5696295	-74.1097618	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2153	12026749712	40.5978941	-73.9638353	Brooklyn	706	NY	Avenue U	U Cafe	+1-347-702-8286	\N	11223	\N	\N	\N	\N	\N	\N
2154	12026788865	40.5757461	-73.9804816	Brooklyn	1223	NY	Surf Avenue	CoCo Fresh Tea & Juice	\N	\N	11224	\N	\N	\N	\N	\N	\N
2155	12042873185	40.7784666	-73.9808526	New York	163	NY	West 72nd Street	Hungry & Healthy Marketplace	+1-646-476-6195	\N	10023	\N	\N	\N	\N	\N	\N
2156	12043679262	40.6812052	-73.9940616	\N	\N	\N	\N	Liz’s  Book Bar	+1-718-210-2222	\N	\N	\N	\N	\N	\N	\N	\N
2157	12055375089	40.6781757	-73.9684662	\N	631	\N	Vanderbilt Avenue	Bontree	\N	\N	11238	\N	\N	\N	\N	\N	\N
2158	12055618255	40.725889	-73.9954623	New York	166	\N	Crosby Street	Cafe Lyria	\N	\N	10012	\N	\N	\N	\N	\N	\N
2159	12055649675	40.7246991	-73.9932247	New York	290	\N	Elizabeth Street	Raf''s	\N	\N	10012	\N	\N	\N	\N	\N	\N
2160	12065422572	40.7744639	-73.9509001	\N	\N	\N	\N	Green Lane Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2161	12067967003	40.7410235	-73.9326532	\N	\N	\N	\N	Bella Blue	+1 718-392-1927	\N	\N	\N	\N	\N	\N	\N	\N
2162	12081972242	40.783362	-73.974207	New York	445	NY	Columbus Avenue	About Coffee	\N	\N	10024	\N	\N	\N	\N	\N	\N
2163	12083348553	40.7510542	-73.8425138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2164	12083521695	40.7686957	-73.9518229	\N	501	\N	East 75th Street	Chez les Frenchies	+1 347-462-5346	\N	\N	chezlesfrenchies@gmail.com	\N	\N	\N	\N	\N
2165	12084131486	40.7244254	-73.9787948	\N	\N	\N	\N	Kosmic Community Anti Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
2166	12086289679	40.776121	-73.9837543	\N	\N	\N	\N	Le Petit Parisien	\N	\N	\N	\N	\N	\N	\N	\N	\N
2167	12095137001	40.7655727	-73.9543985	\N	\N	\N	\N	Naya	\N	\N	\N	\N	\N	\N	\N	\N	\N
2168	12095137003	40.7659365	-73.9541722	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2169	12095745427	40.6871101	-73.9937741	\N	\N	\N	\N	Octavia	\N	\N	\N	\N	\N	\N	\N	\N	\N
2170	12102851138	40.7514912	-73.9862834	New York	990	NY	6th Avenue	Paris Baguette	+1 631-651-0404	\N	10018	\N	\N	\N	\N	\N	\N
2171	12102901861	40.7157994	-74.0109094	New York	295	NY	Greenwich Street	Joe & The Juice	+1 646-741-8640	\N	10007	\N	\N	\N	\N	\N	\N
2172	12107605899	40.7607859	-73.9173207	\N	\N	\N	\N	Café de Colombia II	\N	\N	\N	\N	\N	\N	\N	\N	\N
2173	12117530628	40.7701886	-73.93438	Astoria	11-12	NY	30th Drive	DAGNY Astoria	+1 (929) 412 0112	\N	11102	info@dagnyastoria.com	\N	\N	\N	\N	\N
2174	12120372893	40.7575906	-73.9674597	New York	240	NY	East 54th Street	Birch Coffee	+12126861444	\N	10022	\N	\N	\N	\N	\N	\N
2175	12122432674	40.755991	-73.9904415	New York	620	NY	8th Avenue	Starbucks	+1 6468680222	\N	10018	\N	\N	\N	\N	\N	\N
2176	12133056411	40.7581078	-73.9281495	Astoria	31-05	NY	35th Avenue	Elevenses	\N	\N	11106	\N	\N	\N	\N	\N	\N
2177	12143901107	40.7512425	-73.8073518	\N	\N	\N	\N	4rabet office	\N	\N	\N	\N	\N	\N	\N	\N	\N
2178	12146166169	40.7278978	-73.9792841	\N	\N	\N	\N	Hi-Note	\N	\N	\N	\N	\N	\N	\N	\N	\N
2179	12150569640	40.7663014	-73.9573166	\N	1293	\N	1st Avenue	Hawa	\N	\N	\N	\N	\N	\N	\N	\N	\N
2180	12162522174	40.7752427	-73.909958	\N	\N	\N	\N	OK Café	\N	\N	\N	\N	\N	\N	\N	\N	\N
2181	12162663961	40.7038444	-73.9867404	\N	\N	\N	\N	Fountainhaus	\N	\N	\N	\N	\N	\N	\N	\N	\N
2182	12162675630	40.7575196	-73.9199801	\N	32-55	\N	Steinway Street	Uncle Drink	+1646-515-9688	\N	\N	\N	\N	\N	\N	\N	\N
2183	12162708534	40.7625829	-73.9158768	\N	\N	\N	Steinway Street	Dunkin	\N	\N	\N	\N	\N	\N	\N	\N	\N
2184	12162717778	40.7635075	-73.9151169	\N	30-09	\N	Steinway Street	Fitrition	\N	\N	\N	\N	\N	\N	\N	\N	\N
2185	12164548427	40.7744155	-73.9085343	\N	\N	\N	\N	Vivi Bubble Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2186	12166885751	40.7766515	-73.9117101	\N	\N	\N	\N	Seek Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2187	12175308337	40.6823014	-73.7666081	\N	125-11	\N	Merrick Boulevard	Queenz Bakery Cafe	\N	\N	11434	\N	\N	\N	\N	\N	\N
2188	12175767750	40.7523869	-73.9211157	\N	\N	\N	\N	Dunkin	\N	\N	\N	\N	\N	\N	\N	\N	\N
2189	12177578858	40.7605195	-73.9908845	\N	\N	\N	9th Avenue	Matto Espresso	+1 347-882-8000	\N	\N	\N	\N	\N	\N	\N	646
2190	12177578860	40.7604315	-73.9909436	\N	644	\N	9th Avenue	Juice Generation	\N	\N	\N	\N	\N	\N	\N	\N	\N
2191	12179336448	40.7367571	-73.9321955	\N	\N	\N	\N	Dunkin	\N	\N	\N	\N	\N	\N	\N	\N	\N
2192	12195365777	40.765853	-73.9136305	\N	25-88	\N	Steinway Street	Chocolate House	+1 718-278-6912	\N	\N	\N	\N	\N	\N	\N	\N
2193	12195740993	40.7293401	-74.0049942	\N	230	\N	Varick Street	Starbucks Pickup	+1-646-444-8086	\N	10014	\N	\N	\N	\N	\N	\N
2194	12200487947	40.7335751	-73.9897	New York	133	NY	4th Avenue	Love Mi Yogurt	+1-646-767-9868	\N	10003	\N	\N	\N	\N	\N	\N
2195	12202478856	40.7443879	-73.9113528	\N	53-04	\N	Roosevelt Avenue	My Coffee Shop	+1 347-970-1815	\N	\N	\N	\N	\N	\N	\N	\N
2196	12207819344	40.7609179	-73.9823212	New York	80	NY	Fifth Avenue	Kopifellas	+1-917-485-9846	\N	10011	\N	\N	\N	\N	\N	\N
2197	12218766176	40.7332744	-73.8624136	\N	\N	\N	\N	Gong Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
2198	12228222776	40.643557	-73.7910063	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2199	12230629417	40.7743341	-73.9555786	\N	228	\N	East 80th Street	787 Coffee	\N	\N	10075	\N	\N	\N	\N	\N	\N
2200	12232805298	40.7429695	-73.9804129	\N	416	\N	3rd Avenue	Moka & Co	\N	\N	10016	\N	\N	\N	\N	\N	\N
2201	12245062416	40.7745929	-73.9129453	\N	\N	\N	\N	To Laiko	\N	\N	\N	\N	\N	\N	\N	\N	\N
2202	12246616257	40.7585572	-73.9865632	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2203	12247119193	40.6208198	-74.0266037	\N	\N	\N	\N	Kung Fu Tea	+1-347-906-7261	\N	\N	\N	\N	\N	\N	\N	\N
2204	12248243320	40.6361965	-74.0126301	\N	6104	\N	7th Avenue	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2205	12248272577	40.6365948	-74.011783	\N	6003	\N	7th Avenue	In Cha	\N	\N	\N	\N	\N	\N	\N	\N	\N
2206	12248356098	40.7024115	-73.9904796	\N	\N	\N	\N	Zaruma	\N	\N	\N	\N	\N	\N	\N	\N	\N
2207	12251081136	40.6239567	-74.0306888	\N	8511	\N	3rd Avenue	Boca De Cielo	\N	\N	11209	\N	\N	\N	\N	\N	\N
2208	12251325099	40.6659024	-73.9930413	\N	175	\N	Prospect Avenue	No Filter Coffee	\N	\N	11215	\N	\N	\N	\N	\N	\N
2209	12253456376	40.7072233	-73.9430166	Brooklyn	164	NY	Graham Avenue	Win Son Bakery	+1 (917) 909-1725	\N	11206	bakery@winsonbrooklyn.com	\N	\N	\N	\N	\N
2210	12254980775	40.7217666	-73.9921781	\N	\N	\N	\N	The Dutchess Tea House	\N	\N	\N	\N	\N	\N	\N	\N	\N
2211	12259503231	40.6979898	-73.9367674	\N	\N	\N	\N	High & Dry	\N	\N	\N	\N	\N	\N	\N	\N	\N
2212	12269406401	40.7061778	-73.9211621	Brooklyn	1329	NY	Willoughby Avenue	Bunker Bk Cafe	\N	\N	11237	\N	\N	\N	\N	\N	\N
2213	12272040575	40.6787836	-73.9495223	\N	\N	\N	\N	Furman''s Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2214	12272139785	40.7060756	-73.9104845	Ridgewood	517	NY	Onderdonk Avenue	Honey Moon Coffee Shop	\N	\N	11385	\N	\N	\N	\N	\N	\N
2215	12288613872	40.7494227	-73.9799574	\N	\N	\N	\N	Björk Cafe	+1-212-847-9745	\N	\N	\N	\N	\N	\N	\N	\N
2216	12299680838	40.7470898	-73.890311	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2217	12307168436	40.6696214	-73.9895996	\N	\N	\N	\N	Luna La Mer	\N	\N	\N	\N	\N	\N	\N	\N	\N
2218	12307831703	40.7136888	-73.993096	New York	105	NY	East Broadway	Modern Coffee House	\N	\N	\N	\N	\N	\N	\N	\N	\N
2219	12312825826	40.7417125	-74.0053593	\N	\N	\N	\N	Starbucks Reserve Roastery	\N	\N	\N	\N	\N	\N	\N	\N	\N
2220	12327528096	40.7275652	-73.9826272	\N	149	\N	Avenue A	Blank Street Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2221	12331073196	40.7379164	-73.9883261	\N	\N	\N	\N	Starbucks	\N	\N	\N	\N	\N	\N	\N	\N	\N
2222	12334487675	40.7292501	-73.9810072	\N	\N	\N	\N	Oasis Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2223	12334487681	40.7298277	-73.9805804	\N	\N	\N	\N	Cafe Joah	\N	\N	\N	\N	\N	\N	\N	\N	\N
2224	12350543849	40.7258246	-74.0012786	New York	156	NY	Prince Street	L.A. Burdick Handmade Chocolates	+1 212-796-0143	\N	10012	\N	\N	\N	\N	\N	\N
2225	12360594370	40.7620734	-73.7700459	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2226	12365507726	40.7211169	-73.9944719	\N	8	\N	Spring Street	Yours Truly Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2227	12365547753	40.7218228	-73.9957101	New York	35	\N	Spring Street	Boba Guys	\N	\N	\N	\N	\N	\N	\N	\N	\N
2228	12365555328	40.7220431	-73.9967564	New York	56	\N	Spring Street	Spring Lemon Tree	\N	\N	\N	\N	\N	\N	\N	\N	\N
2229	12365598708	40.7224732	-73.9972411	\N	63	\N	Spring Street	The Green Room by Blank Street Coffee	\N	\N	\N	\N	\N	\N	\N	\N	\N
2230	12368030383	40.5971232	-73.9507592	\N	2633	\N	Ocean Avenue	Mouette	+1 929-410-2299	\N	\N	\N	\N	\N	\N	\N	\N
2231	12368281668	40.7297632	-73.9834978	New York	194	\N	1st Avenue	Red Beard Bakery	\N	\N	\N	\N	\N	\N	\N	\N	\N
2232	12373120895	40.7261154	-73.7911297	\N	\N	\N	\N	Mango Mango Dessert	\N	\N	\N	\N	\N	\N	\N	\N	\N
2233	12385656270	40.5956037	-74.0857073	\N	\N	\N	\N	Royal Crown Bakery Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2234	12386676805	40.7538244	-73.804193	\N	\N	\N	\N	ABC Billiards & Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2235	12396937575	40.7900164	-73.9477263	\N	1629	\N	Lexington Avenue	Da blanca pizzeria	+1 645 7819001	\N	10029	\N	\N	\N	\N	\N	\N
2236	12412618920	40.7475252	-73.8837661	\N	\N	\N	\N	Kung Fu Tea	\N	\N	\N	\N	\N	\N	\N	\N	\N
2237	12412959742	40.7507303	-73.9767376	\N	370	\N	Lexington Avenue	Le Pain Quotidien	+1-332-910-7522	\N	10017	\N	\N	\N	\N	\N	\N
2238	12440279485	40.7296464	-74.0018437	New York	205	NY	Bleecker Street	Pop Up Grocer	\N	\N	10012	\N	\N	\N	\N	\N	\N
2239	12445025728	40.6271118	-74.0780312	\N	\N	\N	\N	Best Coffee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
2240	12450134293	40.7681609	-73.9244408	\N	\N	\N	\N	Dunkin Donuts	\N	\N	\N	\N	\N	\N	\N	\N	\N
2241	12456130217	40.6810692	-73.9755853	\N	216	\N	Flatbush Avenue	Sofreh Cafe	+1-929-294-9240	\N	\N	\N	\N	\N	\N	\N	\N
2242	12459424114	40.6713653	-73.9634901	\N	\N	\N	\N	Brooklyn Museum Cafe	\N	\N	\N	\N	\N	\N	\N	\N	\N
2243	12464782371	40.8337656	-73.8611442	Bronx	29	NY	Hugh J. Grant Circle	Starbucks	+1-718-319-1702	\N	10462	\N	\N	\N	\N	\N	\N
2244	12466211114	40.8557102	-73.8881361	\N	\N	\N	\N	Gino''s Pastry Shop & Café	+1-718-584-3558	\N	\N	\N	\N	\N	\N	\N	\N
2245	12466211116	40.8546158	-73.8885636	\N	\N	\N	\N	Morrone Pastry Shop & Café	+1-718-733-0424	\N	\N	\N	\N	\N	\N	\N	\N
2246	12469063673	40.7531442	-73.974998	New York	450	NY	Lexington Avenue	Angelina Bakery Grand Central	6466829497	\N	10017	\N	\N	\N	\N	\N	\N
2247	12469112391	40.7500475	-73.9860309	New York	41	NY	West 35th Street	Angelina Bakery & Pizza	6468640111	\N	10001	\N	\N	\N	\N	\N	\N
2248	12469609076	40.7707562	-73.9202395	Astoria	28-13	NY	Astoria Boulevard	Verse Cafe	\N	\N	11102	\N	\N	\N	\N	\N	\N
2249	12470628921	40.7448189	-73.9821539	\N	\N	\N	\N	Sahola Cofee Shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
2250	12496752009	40.7223663	-73.9950617	\N	\N	\N	\N	The Elk	+1-929-618-2557	\N	\N	\N	\N	\N	\N	\N	\N
2251	12505671172	40.7617834	-73.918434	\N	37-10	\N	\N	Jaguar Café Bistro Bar	\N	\N	\N	\N	\N	\N	\N	\N	\N
2252	12505709615	40.7610284	-73.9175373	\N	31-12	\N	Steinway Street	Florencia Bake & Coffee Shop	+1 347-640-5353	\N	\N	\N	\N	\N	\N	\N	\N
2253	12513048658	40.7647969	-73.9770797	\N	1411	\N	6th Avenue	Starbucks	+1 212-664-1305	\N	10019	\N	\N	\N	\N	\N	\N
2254	12526669807	40.7476794	-73.9927573	\N	\N	\N	\N	Le Pain Quotidien	\N	\N	\N	\N	\N	\N	\N	\N	\N
2255	12527817288	40.8033866	-73.9676206	\N	2811	\N	Broadway	Heytea	\N	\N	10025	\N	\N	\N	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

