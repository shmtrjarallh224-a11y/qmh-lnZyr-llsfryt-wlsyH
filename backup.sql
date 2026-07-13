--
-- PostgreSQL database dump
--

\restrict MzFnS3CkicTSegflJNkMHjKCn3HfPTJCC7fgwmuR6poRD4bo2B3vxoc6s5r0FpR

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banners (
    id integer NOT NULL,
    image_url text NOT NULL,
    title text,
    link_url text,
    sort_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.banners OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banners_id_seq OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    name text NOT NULL,
    country text DEFAULT ''::text NOT NULL,
    city text DEFAULT ''::text NOT NULL,
    address text DEFAULT ''::text NOT NULL,
    google_maps_url text,
    phone text,
    whatsapp text,
    email text,
    work_hours text,
    work_days text,
    image_url text,
    status text DEFAULT 'open'::text NOT NULL,
    is_visible boolean DEFAULT true NOT NULL,
    is_main boolean DEFAULT false NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branches_id_seq OWNER TO postgres;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: company_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_settings (
    id integer DEFAULT 1 NOT NULL,
    company_name text DEFAULT ''::text NOT NULL,
    logo_url text,
    about text,
    address text,
    website_url text,
    google_maps_url text,
    phone_primary text,
    phone_secondary text,
    whatsapp text,
    email_support text,
    email_official text,
    instagram text,
    tiktok text,
    facebook text,
    twitter text,
    snapchat text,
    youtube text,
    linkedin text,
    telegram text,
    work_days text,
    work_hours text,
    weekly_off text,
    extra_socials jsonb,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.company_settings OWNER TO postgres;

--
-- Name: flight_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flight_bookings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reference_number text NOT NULL,
    offer jsonb NOT NULL,
    passengers jsonb NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    provider text DEFAULT 'local'::text NOT NULL,
    provider_mode text,
    booking_reference text,
    duffel_order_id text,
    eticket_numbers jsonb,
    segments jsonb,
    baggage text,
    hold_expires_at timestamp with time zone,
    hold_fee_amount double precision
);


ALTER TABLE public.flight_bookings OWNER TO postgres;

--
-- Name: flight_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flight_bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flight_bookings_id_seq OWNER TO postgres;

--
-- Name: flight_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_bookings_id_seq OWNED BY public.flight_bookings.id;


--
-- Name: hold_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hold_settings (
    id integer DEFAULT 1 NOT NULL,
    hold_enabled boolean DEFAULT true NOT NULL,
    hold_fee_amount double precision DEFAULT 25 NOT NULL,
    hold_duration_hours integer DEFAULT 24 NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.hold_settings OWNER TO postgres;

--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    invoice_number text NOT NULL,
    payment_id integer,
    customer_name text NOT NULL,
    customer_phone text NOT NULL,
    customer_email text,
    items jsonb NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    tax numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    total numeric(10,2) NOT NULL,
    currency text DEFAULT 'IQD'::text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    issued_at timestamp with time zone,
    due_date date,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer,
    title text NOT NULL,
    message text NOT NULL,
    type text DEFAULT 'general'::text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    image_url text,
    data jsonb DEFAULT '{}'::jsonb
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: package_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_bookings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    package_id integer NOT NULL,
    reference_number text NOT NULL,
    travelers_count integer NOT NULL,
    traveler_names text[] NOT NULL,
    passport_numbers text[] NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    travel_date date NOT NULL,
    notes text,
    status text DEFAULT 'received'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.package_bookings OWNER TO postgres;

--
-- Name: package_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_bookings_id_seq OWNER TO postgres;

--
-- Name: package_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_bookings_id_seq OWNED BY public.package_bookings.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    id integer NOT NULL,
    name text NOT NULL,
    country text NOT NULL,
    city text NOT NULL,
    days integer NOT NULL,
    nights integer NOT NULL,
    price_from numeric(10,2) NOT NULL,
    currency text NOT NULL,
    rating numeric(2,1) DEFAULT '0'::numeric NOT NULL,
    images text[] NOT NULL,
    video_url text,
    description text NOT NULL,
    hotels_included text[] NOT NULL,
    hotel_stars integer NOT NULL,
    room_type text NOT NULL,
    meals text NOT NULL,
    transportation text NOT NULL,
    itinerary jsonb NOT NULL,
    included_services text[] NOT NULL,
    excluded_services text[] NOT NULL,
    cancellation_policy text NOT NULL,
    is_featured boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.packages OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packages_id_seq OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    reference_number text NOT NULL,
    booking_type text NOT NULL,
    flight_booking_id integer,
    package_booking_id integer,
    visa_application_id integer,
    customer_name text NOT NULL,
    customer_phone text NOT NULL,
    amount numeric(10,2) NOT NULL,
    currency text DEFAULT 'IQD'::text NOT NULL,
    method text DEFAULT 'cash'::text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    transaction_id text,
    paid_at timestamp with time zone,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: service_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_settings (
    id integer DEFAULT 1 NOT NULL,
    flights_enabled boolean DEFAULT true NOT NULL,
    packages_enabled boolean DEFAULT true NOT NULL,
    visas_enabled boolean DEFAULT true NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.service_settings OWNER TO postgres;

--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    customer_name text NOT NULL,
    avatar_url text,
    rating integer NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.testimonials OWNER TO postgres;

--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.testimonials_id_seq OWNER TO postgres;

--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone text NOT NULL,
    email text,
    password_hash text NOT NULL,
    avatar_url text,
    role text DEFAULT 'customer'::text NOT NULL,
    language text DEFAULT 'ar'::text NOT NULL,
    currency text DEFAULT 'USD'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    first_name text,
    father_name text,
    grandfather_name text,
    family_name text,
    english_name text,
    gender text,
    dob text,
    nationality text,
    place_of_birth text,
    marital_status text,
    occupation text,
    whatsapp text,
    address text,
    passport_number text,
    passport_issuing_country text,
    passport_issuing_place text,
    passport_issue_date text,
    passport_expiry text,
    passport_image_url text,
    has_gulf_residence boolean DEFAULT false NOT NULL,
    gulf_residence_country text,
    gulf_residence_number text,
    gulf_residence_expiry text,
    gulf_residence_front_url text,
    gulf_residence_back_url text,
    profile_completed_at timestamp with time zone,
    active_visas jsonb DEFAULT '[]'::jsonb NOT NULL,
    travel_history jsonb DEFAULT '[]'::jsonb NOT NULL,
    has_travel_history boolean DEFAULT false NOT NULL,
    has_active_foreign_visa boolean DEFAULT false NOT NULL,
    residence_type text DEFAULT 'none'::text NOT NULL,
    permissions jsonb,
    expo_push_token text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visa_application_consents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visa_application_consents (
    id integer NOT NULL,
    user_id integer NOT NULL,
    visa_id integer NOT NULL,
    accepted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.visa_application_consents OWNER TO postgres;

--
-- Name: visa_application_consents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visa_application_consents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visa_application_consents_id_seq OWNER TO postgres;

--
-- Name: visa_application_consents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visa_application_consents_id_seq OWNED BY public.visa_application_consents.id;


--
-- Name: visa_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visa_applications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    visa_id integer NOT NULL,
    reference_number text NOT NULL,
    full_name text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    nationality text NOT NULL,
    passport_number text NOT NULL,
    passport_expiry date NOT NULL,
    dob date NOT NULL,
    gender text NOT NULL,
    occupation text NOT NULL,
    city text NOT NULL,
    passport_image_url text,
    personal_photo_url text,
    status text DEFAULT 'received'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    passport_type text,
    issuing_country text,
    passport_issue_date date,
    place_of_birth text,
    mrz text,
    ocr_confidence integer,
    ocr_verified boolean DEFAULT false NOT NULL,
    status_history jsonb DEFAULT '[]'::jsonb NOT NULL,
    requested_documents jsonb DEFAULT '[]'::jsonb NOT NULL,
    additional_document_urls jsonb DEFAULT '[]'::jsonb NOT NULL
);


ALTER TABLE public.visa_applications OWNER TO postgres;

--
-- Name: visa_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visa_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visa_applications_id_seq OWNER TO postgres;

--
-- Name: visa_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visa_applications_id_seq OWNED BY public.visa_applications.id;


--
-- Name: visa_eligibility_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visa_eligibility_rules (
    id integer NOT NULL,
    visa_id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    nationalities text[] DEFAULT '{}'::text[] NOT NULL,
    allow_direct boolean DEFAULT false NOT NULL,
    requires_gulf_residence boolean DEFAULT false NOT NULL,
    requires_valid_visa_countries text[] DEFAULT '{}'::text[] NOT NULL,
    requires_invitation_letter boolean DEFAULT false NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.visa_eligibility_rules OWNER TO postgres;

--
-- Name: visa_eligibility_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visa_eligibility_rules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visa_eligibility_rules_id_seq OWNER TO postgres;

--
-- Name: visa_eligibility_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visa_eligibility_rules_id_seq OWNED BY public.visa_eligibility_rules.id;


--
-- Name: visas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visas (
    id integer NOT NULL,
    country_name text NOT NULL,
    country_flag_url text NOT NULL,
    country_image_url text NOT NULL,
    visa_type text NOT NULL,
    processing_time text NOT NULL,
    stay_duration text NOT NULL,
    price numeric(10,2) NOT NULL,
    currency text NOT NULL,
    description text NOT NULL,
    required_documents text[] NOT NULL,
    entries_allowed text NOT NULL,
    validity text NOT NULL,
    is_featured boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    requires_gulf_residence boolean DEFAULT false NOT NULL,
    requires_personal_photo boolean DEFAULT true NOT NULL,
    requires_passport_image boolean DEFAULT true NOT NULL,
    requires_bank_statement boolean DEFAULT false NOT NULL,
    requires_flight_booking boolean DEFAULT false NOT NULL,
    requires_hotel_booking boolean DEFAULT false NOT NULL,
    requires_travel_insurance boolean DEFAULT false NOT NULL,
    requires_additional_docs boolean DEFAULT false NOT NULL,
    allowed_nationalities text[] DEFAULT '{}'::text[] NOT NULL,
    blocked_nationalities text[] DEFAULT '{}'::text[] NOT NULL,
    requires_gulf_residence_country text,
    requires_valid_visa_countries text[] DEFAULT '{}'::text[] NOT NULL,
    requires_invitation_letter boolean DEFAULT false NOT NULL,
    country_code text
);


ALTER TABLE public.visas OWNER TO postgres;

--
-- Name: visas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visas_id_seq OWNER TO postgres;

--
-- Name: visas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visas_id_seq OWNED BY public.visas.id;


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: flight_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_bookings ALTER COLUMN id SET DEFAULT nextval('public.flight_bookings_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: package_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_bookings ALTER COLUMN id SET DEFAULT nextval('public.package_bookings_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visa_application_consents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_application_consents ALTER COLUMN id SET DEFAULT nextval('public.visa_application_consents_id_seq'::regclass);


--
-- Name: visa_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_applications ALTER COLUMN id SET DEFAULT nextval('public.visa_applications_id_seq'::regclass);


--
-- Name: visa_eligibility_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_eligibility_rules ALTER COLUMN id SET DEFAULT nextval('public.visa_eligibility_rules_id_seq'::regclass);


--
-- Name: visas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visas ALTER COLUMN id SET DEFAULT nextval('public.visas_id_seq'::regclass);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banners (id, image_url, title, link_url, sort_order, is_active, created_at) FROM stdin;
1	https://images.unsplash.com/photo-1436491865332-7a61a109cc05	Summer Visa Offers	\N	1	t	2026-07-10 01:29:32.268677+00
3	https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=1200	اكتشف تركيا الساحرة	\N	1	t	2026-07-10 03:33:00.169918+00
4	https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=1200	دبي - المدينة التي لا تنام	\N	2	t	2026-07-10 03:33:00.173881+00
5	https://images.unsplash.com/photo-1533105079780-92b9be482077?w=1200	سانتوريني - جنة اليونان	\N	3	t	2026-07-10 03:33:00.175861+00
6	https://images.unsplash.com/photo-1549880338-65ddcdfd017b?w=1200	ماليزيا - الطبيعة والحضارة	\N	4	t	2026-07-10 03:33:00.177862+00
2	https://images.unsplash.com/photo-1467269204594-9661b134dd2b	Explore Dubai This Season	\N	2	f	2026-07-10 01:29:32.268677+00
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branches (id, name, country, city, address, google_maps_url, phone, whatsapp, email, work_hours, work_days, image_url, status, is_visible, is_main, sort_order, created_at) FROM stdin;
\.


--
-- Data for Name: company_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_settings (id, company_name, logo_url, about, address, website_url, google_maps_url, phone_primary, phone_secondary, whatsapp, email_support, email_official, instagram, tiktok, facebook, twitter, snapchat, youtube, linkedin, telegram, work_days, work_hours, weekly_off, extra_socials, updated_at) FROM stdin;
1	قمة النظائر للسفريات والسياحة      QEMA AL-NAZAER FOR TRAVEL & TOURISM	\N	\N	العراق - البصرة - الجزائر - العباسية / شارع كيا سابقاً	\N	\N	+964 780 101 6390	\N	\N	alnathair2@gmail.com	alnathair2@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-12 02:20:22.005+00
\.


--
-- Data for Name: flight_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_bookings (id, user_id, reference_number, offer, passengers, phone, email, status, created_at, provider, provider_mode, booking_reference, duffel_order_id, eticket_numbers, segments, baggage, hold_expires_at, hold_fee_amount) FROM stdin;
35	4	HLD-MRH3E90Y-NM7H0V	{"id": "off_0000B8FC0YetEwbVTYXRSZ", "price": 236.65, "stops": 1, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-18T21:25:00.000Z", "cabinClass": "economy", "departTime": "2026-07-18T16:10:00.000Z", "airlineName": "Oman Air", "fromAirport": "DOH", "flightNumber": "WY0664", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/WY.svg", "durationMinutes": 255}	[{"dob": "1993-05-18", "gender": "ذكر", "lastName": "ALI", "firstName": "MOHAMMED", "nationality": "AO", "passportExpiry": "2035-08-18", "passportNumber": "252582852", "passportIssueCountry": "AO"}]	+966558729925	alkwytalraq712@gmail.com	cancelled	2026-07-12 01:06:01.907576+00	local	\N	\N	\N	\N	\N	\N	2026-07-13 01:06:01.906+00	25
39	4	HLD-MRHB06R1-XM7C4S	{"id": "off_0000B8FUZ2t061z8oBUuDc", "price": 158.13, "stops": 0, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-21T16:00:00.000Z", "cabinClass": "economy", "departTime": "2026-07-21T12:10:00.000Z", "airlineName": "Saudi Arabian Airlines", "fromAirport": "JED", "flightNumber": "SV0588", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/SV.svg", "durationMinutes": 170}	[{"dob": "2010-02-04", "gender": "ذكر", "lastName": "tjht", "firstName": "fgjn", "nationality": "AG", "passportExpiry": "2044-05-18", "passportNumber": "4646", "passportIssueCountry": "AO"}]	78686	alkwytalraq712@gmail.com	confirmed	2026-07-12 04:39:02.702514+00	local	\N	\N	\N	\N	\N	\N	2026-07-13 04:39:02.701+00	25
2	4	FLT-MRG1RTEM-BAFDN2	{"id": "off_0000B8DfwxjUxXIF3oLL8Z", "price": 482.1, "stops": 1, "currency": "USD", "toAirport": "AMM", "arriveTime": "2026-07-30T23:30:00.000Z", "cabinClass": "economy", "departTime": "2026-07-30T12:00:00.000Z", "airlineName": "Qatar Airways", "fromAirport": "SLL", "flightNumber": "QR1145", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/QR.svg", "durationMinutes": 750}	[{"dob": "1998-11-12", "gender": "ذكر", "lastName": "alshadhbi", "firstName": "mohammed", "nationality": "yemen", "passportExpiry": "2030-06-05", "passportNumber": "08744144", "passportIssueCountry": "اليمن"}]	+967779055522	mmmmksa2022@gmail.com	ticketed	2026-07-11 07:32:49.439056+00	local	\N	\N	\N	\N	\N	\N	\N	\N
1	4	FLT-MRFX407W-R6N0JD	{"id": "off_0000B8DULBOvFjruqXtm8J", "price": 107.1, "stops": 0, "currency": "USD", "toAirport": "BGW", "arriveTime": "2026-07-30T02:18:00.000Z", "cabinClass": "economy", "departTime": "2026-07-29T21:40:00.000Z", "airlineName": "Duffel Airways", "fromAirport": "KRT", "flightNumber": "ZZ3356", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-logo/ZZ.svg", "durationMinutes": 218}	[{"dob": "1999-11-11", "gender": "ذكر", "lastName": "54677577", "firstName": "فق", "nationality": "عراقي", "passportExpiry": "2030-11-11", "passportNumber": "885885", "passportIssueCountry": "العراق"}]	+946779055522	alkwytalraq712@gmail.com	cancelled	2026-07-11 05:22:20.061493+00	local	\N	\N	\N	\N	\N	\N	\N	\N
38	4	HLD-MRHAZTYJ-BGHI6I	{"id": "off_0000B8FUZ2t061z8oBUuDc", "price": 158.13, "stops": 0, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-21T16:00:00.000Z", "cabinClass": "economy", "departTime": "2026-07-21T12:10:00.000Z", "airlineName": "Saudi Arabian Airlines", "fromAirport": "JED", "flightNumber": "SV0588", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/SV.svg", "durationMinutes": 170}	[{"dob": "2010-02-04", "gender": "ذكر", "lastName": "tjht", "firstName": "fgjn", "nationality": "AG", "passportExpiry": "2044-05-18", "passportNumber": "4646", "passportIssueCountry": "AO"}]	78686	alkwytalraq712@gmail.com	confirmed	2026-07-12 04:38:46.12493+00	local	\N	\N	\N	\N	\N	\N	2026-07-13 04:38:46.123+00	25
37	4	HLD-MRHAVJXH-1DTKXT	{"id": "off_0000B8FUZ2t061z8oBUuDc", "price": 158.13, "stops": 0, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-21T16:00:00.000Z", "cabinClass": "economy", "departTime": "2026-07-21T12:10:00.000Z", "airlineName": "Saudi Arabian Airlines", "fromAirport": "JED", "flightNumber": "SV0588", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/SV.svg", "durationMinutes": 170}	[{"dob": "1978-05-17", "gender": "ذكر", "lastName": "yj", "firstName": "rtj", "nationality": "AD", "passportExpiry": "2042-05-18", "passportNumber": "7676", "passportIssueCountry": "AD"}]	8678697869	alkwytalraq712@gmail.com	confirmed	2026-07-12 04:35:26.502001+00	local	\N	\N	\N	\N	\N	\N	2026-07-13 04:35:26.501+00	25
36	4	HLD-MRHAUWS3-EQVU1K	{"id": "off_0000B8FUZ2t061z8oBUuDc", "price": 158.13, "stops": 0, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-21T16:00:00.000Z", "cabinClass": "economy", "departTime": "2026-07-21T12:10:00.000Z", "airlineName": "Saudi Arabian Airlines", "fromAirport": "JED", "flightNumber": "SV0588", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/SV.svg", "durationMinutes": 170}	[{"dob": "1978-05-17", "gender": "ذكر", "lastName": "yj", "firstName": "rtj", "nationality": "AD", "passportExpiry": "2042-05-18", "passportNumber": "7676", "passportIssueCountry": "AD"}]	8678697869	alkwytalraq712@gmail.com	confirmed	2026-07-12 04:34:56.499885+00	local	\N	\N	\N	\N	\N	\N	2026-07-13 04:34:56.499+00	25
40	4	FLT-MRHBQ9RC-J5F697	{"id": "off_0000B8FWhGX9RFcFMQKDKJ", "price": 739.6, "stops": 1, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-28T11:40:00.000Z", "cabinClass": "economy", "departTime": "2026-07-27T22:05:00.000Z", "airlineName": "Qatar Airways", "fromAirport": "BGW", "flightNumber": "QR0443", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/QR.svg", "durationMinutes": 755}	[{"dob": "1990-05-18", "gender": "ذكر", "lastName": "fdjh", "firstName": "jh", "nationality": "AG", "passportExpiry": "2036-02-11", "passportNumber": "464646", "passportIssueCountry": "AM"}]	+96744746	alkwytalraq712@gmail.com	confirmed	2026-07-12 04:59:19.660133+00	local	\N	\N	\N	\N	\N	\N	\N	\N
41	4	FLT-MRHBSXER-BQH7TD	{"id": "off_0000B8FX2uTjBPDKlXHQdN", "price": 232.66, "stops": 0, "currency": "USD", "toAirport": "DXB", "arriveTime": "2026-07-14T12:00:00.000Z", "cabinClass": "economy", "departTime": "2026-07-14T09:00:00.000Z", "airlineName": "Saudi Arabian Airlines", "fromAirport": "RUH", "flightNumber": "SV0596", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/SV.svg", "durationMinutes": 120}	[{"dob": "1995-02-11", "gender": "ذكر", "lastName": "jh", "firstName": "tujh", "nationality": "AD", "passportExpiry": "2039-02-11", "passportNumber": "456546456", "passportIssueCountry": "AG"}]	4565464	alkwytalraq712@gmail.com	confirmed	2026-07-12 05:01:23.620727+00	local	\N	\N	\N	\N	\N	\N	\N	\N
42	62	FLT-MRIE0JEP-DOKHG8	{"id": "off_0000B8H4SURy4NkHDNDpmb", "price": 176.22, "stops": 0, "currency": "USD", "toAirport": "RUH", "arriveTime": "2026-07-27T04:15:00.000Z", "cabinClass": "economy", "departTime": "2026-07-27T01:30:00.000Z", "airlineName": "Flynas", "fromAirport": "CAI", "flightNumber": "XY0288", "airlineLogoUrl": "https://assets.duffel.com/img/airlines/for-light-background/full-color-lockup/XY.svg", "durationMinutes": 165}	[{"dob": "1998-11-12", "gender": "ذكر", "lastName": "ALSHADHBI ", "firstName": "MOHAMMED ", "nationality": "YE", "passportExpiry": "2028-02-11", "passportNumber": "08744144", "passportIssueCountry": "YE"}]	+967779055522	owus711@gmail.com	pending	2026-07-12 22:51:04.130648+00	local	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: hold_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hold_settings (id, hold_enabled, hold_fee_amount, hold_duration_hours, updated_at) FROM stdin;
1	t	25	24	2026-07-12 00:53:31.013025+00
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, invoice_number, payment_id, customer_name, customer_phone, customer_email, items, subtotal, tax, total, currency, status, issued_at, due_date, notes, created_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, title, message, type, is_read, created_at, image_url, data) FROM stdin;
\.


--
-- Data for Name: package_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_bookings (id, user_id, package_id, reference_number, travelers_count, traveler_names, passport_numbers, phone, email, travel_date, notes, status, created_at) FROM stdin;
1	4	8	PKG-MRFX94ZU-KZUN7H	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	received	2026-07-11 05:26:19.530872+00
2	4	8	PKG-MRFX97BL-D0XINM	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	received	2026-07-11 05:26:22.545994+00
3	4	8	PKG-MRFX97YR-BPEYPS	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	received	2026-07-11 05:26:23.380261+00
4	4	8	PKG-MRFX9B43-Z57FKW	3	{محمد,"",""}	{3463476347,"",""}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	received	2026-07-11 05:26:27.459958+00
8	4	8	PKG-MRFX9R7L-VXRTC5	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	cancelled	2026-07-11 05:26:48.322019+00
7	4	8	PKG-MRFX9HFA-CLTLWP	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	cancelled	2026-07-11 05:26:35.639303+00
6	4	8	PKG-MRFX9DWC-TOOEC2	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	cancelled	2026-07-11 05:26:31.068488+00
5	4	8	PKG-MRFX9CV5-8N1EZ1	1	{محمد}	{3463476347}	+946779055522	alkwytalraq712@gmail.com	2026-11-11	عفف	cancelled	2026-07-11 05:26:29.729893+00
9	4	1	PKG-MRHBEYCB-8GGI9X	1	{محمد}	{57456424}	+967779055554	ikhkdfhk@gmil.com	2026-11-11	\N	received	2026-07-12 04:50:31.644689+00
10	4	1	PKG-MRHBZIK2-YUT3F8	1	{ع}	{B19330517}	07700000000	admin@qema.com	2032-02-24	\N	received	2026-07-12 05:06:30.962719+00
11	4	1	PKG-MRHBZJA8-3WO3KI	1	{ع}	{B19330517}	07700000000	admin@qema.com	2032-02-24	\N	received	2026-07-12 05:06:31.905078+00
12	4	1	PKG-MRHBZJV6-GUHHFT	1	{ع}	{B19330517}	07700000000	admin@qema.com	2032-02-24	\N	received	2026-07-12 05:06:32.658929+00
13	4	1	PKG-MRHCGI5J-OJ842M	1	{ع}	{B19330517}	07700000000	admin@qema.com	2040-02-25	\N	received	2026-07-12 05:19:43.592646+00
14	4	1	PKG-MRHCHS21-NX9BCJ	1	{ع}	{B19330517}	07700000000	admin@qema.com	2031-05-18	\N	received	2026-07-12 05:20:43.082264+00
15	4	1	PKG-MRHCI8HR-91E7AH	1	{ع}	{B19330517}	07700000000	admin@qema.com	2031-05-18	\N	received	2026-07-12 05:21:04.384353+00
16	4	1	PKG-MRHD2JX6-TG6MCJ	1	{ع}	{B19330517}	07700000000	admin@qema.com	2030-02-11	\N	received	2026-07-12 05:36:52.316377+00
17	4	1	PKG-MRHD2KKP-T4JDT5	1	{ع}	{B19330517}	07700000000	admin@qema.com	2030-02-11	\N	received	2026-07-12 05:36:53.162341+00
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, name, country, city, days, nights, price_from, currency, rating, images, video_url, description, hotels_included, hotel_stars, room_type, meals, transportation, itinerary, included_services, excluded_services, cancellation_policy, is_featured, created_at) FROM stdin;
1	Istanbul City Escape	Turkey	Istanbul	5	4	450.00	USD	4.7	{https://images.unsplash.com/photo-1524231757912-21f4fe3a7200,https://images.unsplash.com/photo-1541432901042-2d8bd64b4a9b}	\N	A five-day dive into Istanbul's bazaars, Bosphorus views, and Ottoman history.	{"Grand Hyatt Istanbul"}	5	Double room	Breakfast included	Private airport transfer	[{"day": 1, "title": "Arrival", "description": "Airport pickup and hotel check-in"}, {"day": 2, "title": "Old City Tour", "description": "Hagia Sophia, Blue Mosque, Topkapi Palace"}, {"day": 3, "title": "Bosphorus Cruise", "description": "Evening cruise with dinner"}, {"day": 4, "title": "Grand Bazaar", "description": "Shopping and Turkish bath experience"}, {"day": 5, "title": "Departure", "description": "Free morning, airport drop-off"}]	{Hotel,Breakfast,"Airport transfers","City tour"}	{Flights,"Visa fees","Personal expenses"}	Free cancellation up to 7 days before travel.	t	2026-07-10 01:29:20.833995+00
2	Tbilisi & Kazbegi Adventure	Georgia	Tbilisi	6	5	380.00	USD	4.6	{https://images.unsplash.com/photo-1565008447742-97f6f38c985c}	\N	Old Tbilisi charm combined with the dramatic peaks of Kazbegi.	{"Ambassadori Hotel Tbilisi"}	4	Double room	Half board	Private van	[{"day": 1, "title": "Arrival in Tbilisi", "description": "Check-in and old town walk"}, {"day": 2, "title": "Kazbegi day trip", "description": "Gergeti Trinity Church and mountain views"}, {"day": 3, "title": "Sighnaghi & wine region", "description": "Kakheti wine tasting"}, {"day": 4, "title": "Tbilisi free day", "description": "Sulfur baths and local markets"}, {"day": 5, "title": "Mtskheta", "description": "UNESCO heritage sites"}, {"day": 6, "title": "Departure", "description": "Airport drop-off"}]	{Hotel,"Half board",Transfers,"Guided tours"}	{Flights,"Visa fees"}	Free cancellation up to 5 days before travel.	t	2026-07-10 01:29:20.833995+00
3	Dubai Business & Leisure	UAE	Dubai	4	3	620.00	USD	4.8	{https://images.unsplash.com/photo-1512453979798-5ea266f8880c}	\N	Modern skyline, desert safari, and premium hospitality in Dubai.	{"Address Downtown Dubai"}	5	Executive suite	Breakfast included	Chauffeur service	[{"day": 1, "title": "Arrival", "description": "VIP airport meet & greet"}, {"day": 2, "title": "Downtown & Burj Khalifa", "description": "At the Top experience"}, {"day": 3, "title": "Desert safari", "description": "Dune bashing and BBQ dinner"}, {"day": 4, "title": "Departure", "description": "Free morning, airport transfer"}]	{Hotel,Breakfast,"Desert safari",Transfers}	{Flights,"Visa fees","Meals not listed"}	Free cancellation up to 3 days before travel.	f	2026-07-10 01:29:20.833995+00
4	Kuala Lumpur & Langkawi	Malaysia	Kuala Lumpur	7	6	520.00	USD	4.5	{https://images.unsplash.com/photo-1596422846543-75c6fc197f07}	\N	City lights of KL followed by the island beaches of Langkawi.	{"Berjaya Times Square KL","Meritus Pelangi Langkawi"}	4	Double room	Breakfast included	Domestic flight + transfers	[{"day": 1, "title": "Arrival in KL", "description": "Check-in, Petronas Towers night view"}, {"day": 2, "title": "KL city tour", "description": "Batu Caves and city landmarks"}, {"day": 3, "title": "Fly to Langkawi", "description": "Beach check-in and relaxation"}, {"day": 4, "title": "Island hopping", "description": "Speedboat tour"}, {"day": 5, "title": "Cable car & Sky Bridge", "description": "Langkawi highlands"}, {"day": 6, "title": "Free beach day", "description": "Leisure time"}, {"day": 7, "title": "Departure", "description": "Fly back and airport transfer"}]	{Hotels,Breakfast,"Domestic flight",Transfers}	{"International flights","Visa fees"}	Free cancellation up to 7 days before travel.	t	2026-07-10 01:29:20.833995+00
5	باقة تركيا السياحية الشاملة	تركيا	إسطنبول	7	6	850.00	USD	4.8	{https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800,https://images.unsplash.com/photo-1570939274717-7eda259b50ed?w=800,https://images.unsplash.com/photo-1541432901042-2d8bd64b4a9b?w=800}	\N	استمتع بأجمل تجربة سياحية في تركيا مع باقتنا الشاملة التي تغطي إسطنبول العريقة وكبادوكيا الساحرة، مع أفضل الفنادق والخدمات.	{"فندق بوسفور 5 نجوم","منتجع كبادوكيا 4 نجوم"}	5	غرفة مزدوجة مطلة على البوسفور	إفطار + عشاء	حافلة خاصة مكيفة + رحلات بحرية	[{"day": 1, "title": "الوصول إلى إسطنبول", "description": "الاستقبال في المطار والتوجه للفندق، جولة مسائية في شارع الاستقلال"}, {"day": 2, "title": "إسطنبول التاريخية", "description": "زيارة آيا صوفيا، المسجد الأزرق، قصر توبكابي، والبازار الكبير"}, {"day": 3, "title": "جولة البوسفور", "description": "رحلة بحرية في مضيق البوسفور، زيارة قصر دولمة بهشة، التسوق في شارع بغداد"}, {"day": 4, "title": "السفر إلى كبادوكيا", "description": "رحلة بالطائرة إلى كبادوكيا، جولة في وادي غوريم والمنازل الحجرية"}, {"day": 5, "title": "منطاد كبادوكيا", "description": "رحلة المنطاد الهوائي عند الشروق، زيارة المدينة الجوفية"}, {"day": 6, "title": "العودة إلى إسطنبول", "description": "التسوق وشراء الهدايا، وجبة عشاء على ضفاف البوسفور"}, {"day": 7, "title": "المغادرة", "description": "الإفطار في الفندق، التوجه للمطار ومغادرة إسطنبول"}]	{"تذاكر الطيران ذهاباً وإياباً","الإقامة الفندقية","وجبتا الإفطار والعشاء","جولات سياحية منظمة","مرشد سياحي ناطق بالعربية","تأمين سفر شامل","رسوم التأشيرة"}	{"الغداء والمشروبات","المشتريات الشخصية","الرحلات الاختيارية الإضافية"}	استرداد كامل قبل 30 يوماً من السفر، 50% قبل 15 يوماً، لا استرداد قبل 7 أيام.	t	2026-07-10 03:33:00.014762+00
6	باقة دبي الفاخرة	الإمارات	دبي	5	4	1200.00	USD	4.9	{https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800,https://images.unsplash.com/photo-1518684079-3c830dcef090?w=800,https://images.unsplash.com/photo-1497196823404-14f77de4e6f6?w=800}	\N	تجربة فاخرة في دبي المدينة التي لا تنام، مع إقامة في أفخم الفنادق وزيارة أشهر المعالم السياحية.	{"برج العرب أو فندق أتلانتس 5 نجوم"}	5	جناح ملكي مع إطلالة على البحر	إفطار على الطراز الأمريكي	ليموزين خاص + تاكسي فاخر	[{"day": 1, "title": "الوصول إلى دبي", "description": "الاستقبال VIP في المطار، التوجه للفندق الفاخر، العشاء في مطعم دوار برج خليفة"}, {"day": 2, "title": "دبي الحديثة", "description": "زيارة برج خليفة والطابق 148، التسوق في دبي مول، عرض النافورة الراقصة"}, {"day": 3, "title": "ملاهي ومغامرات", "description": "يوم كامل في حديقة دبي الميراكل، فيراري ورلد أو ديسني لاند"}, {"day": 4, "title": "دبي القديمة", "description": "جولة في ديرة ودبي الذهب والتوابل، عبور بالعبرة التقليدية، عشاء بحري"}, {"day": 5, "title": "آخر يوم في دبي", "description": "التسوق الأخير، زيارة الخور العربي، المغادرة"}]	{"تذاكر الطيران","الإقامة الفاخرة",الإفطار,"استقبال VIP","جولات سياحية","تأمين سفر"}	{"وجبات الغداء والعشاء","نزهات الحياة الليلية",التسوق}	استرداد 75% قبل 21 يوماً، 25% قبل 10 أيام، لا استرداد بعدها.	t	2026-07-10 03:33:00.162064+00
7	باقة ماليزيا الاستوائية	ماليزيا	كوالالمبور	8	7	750.00	USD	4.7	{https://images.unsplash.com/photo-1596422846543-75c6fc197f07?w=800,https://images.unsplash.com/photo-1587474260584-136574528ed5?w=800,https://images.unsplash.com/photo-1549880338-65ddcdfd017b?w=800}	\N	رحلة استثنائية إلى ماليزيا بين عاصمتها النابضة كوالالمبور وجزيرة لنكاوي الخلابة وشبه جزيرة بينانج التاريخية.	{"فندق ماندارين أوريانتال 5 نجوم","منتجع لنكاوي الشاطئي 4 نجوم"}	5	غرفة ديلوكس	إفطار يومي	حافلة سياحية + رحلات داخلية	[{"day": 1, "title": "الوصول إلى كوالالمبور", "description": "الاستقبال في مطار KLIA، تسجيل الوصول في الفندق وراحة"}, {"day": 2, "title": "كوالالمبور السياحية", "description": "أبراج بتروناس، برج كوالالمبور، حديقة الطيور، مركز التسوق ستار هيل"}, {"day": 3, "title": "مغامرة الغابة", "description": "جولة في غابة باتو كيف، معبد سري ماهاماريامان، حديقة الطيور"}, {"day": 4, "title": "السفر إلى لنكاوي", "description": "رحلة داخلية إلى لنكاوي، شاطئ بانتاي تشيناج، رحلة قارب"}, {"day": 5, "title": "جزيرة لنكاوي", "description": "التيليفريك إلى قمة الجبل، جسر السماء، السباحة والغطس"}, {"day": 6, "title": "التسوق الحر في لنكاوي", "description": "منطقة الدوتي فري، بازار لنكاوي، استجمام على الشاطئ"}, {"day": 7, "title": "زيارة بينانج", "description": "تراث جورج تاون، معبد ثاي بوسام، جولة طعام ماليزي"}, {"day": 8, "title": "المغادرة", "description": "العودة إلى كوالالمبور والمغادرة"}]	{"تذاكر الطيران الدولية","رحلات داخلية",الإقامة,"الإفطار اليومي","مرشد سياحي"}	{"وجبات الغداء والعشاء",التأشيرة,"التأمين الإضافي"}	استرداد كامل قبل 25 يوماً، 50% قبل 14 يوماً، لا استرداد بعدها.	t	2026-07-10 03:33:00.165355+00
8	رحلة اليونان - سانتوريني وأثينا	اليونان	أثينا وسانتوريني	9	8	1500.00	USD	4.9	{https://images.unsplash.com/photo-1533105079780-92b9be482077?w=800,https://images.unsplash.com/photo-1596422846543-75c6fc197f07?w=800,https://images.unsplash.com/photo-1570939274717-7eda259b50ed?w=800}	\N	تجربة رومانسية لا تنسى في اليونان بين حضارة أثينا العريقة وزرقة بحر إيجه في سانتوريني.	{"فندق النيل أثينا 4 نجوم","فيلا سانتوريني إيجيان"}	5	غرفة بإطلالة على البحر	إفطار يومي + بعض العشاءات	حافلة + عبّارة + سيارة أجرة	[{"day": 1, "title": "الوصول إلى أثينا", "description": "الوصول والإقامة في فندق وسط المدينة"}, {"day": 2, "title": "أثينا القديمة", "description": "الأكروبول، البارثينون، متحف الأكروبول"}, {"day": 3, "title": "أثينا الحديثة", "description": "بلاكا، منطقة ثيسيو، سوق الأحد"}, {"day": 4, "title": "السفر إلى سانتوريني", "description": "عبّارة إلى سانتوريني، الاستقرار في أويا"}, {"day": 5, "title": "استكشاف أويا", "description": "طلوع الشمس في أويا، الكنائس الزرقاء، المسيرة إلى فيرا"}, {"day": 6, "title": "بركان سانتوريني", "description": "جولة بالقارب حول البركان، الاستحمام في الينابيع الحارة"}, {"day": 7, "title": "شواطئ سانتوريني", "description": "شاطئ كاماري الأسود، شاطئ أكروتيري الأحمر"}, {"day": 8, "title": "التسوق والاستجمام", "description": "آخر يوم في سانتوريني، التسوق من الحلي والتذكارات"}, {"day": 9, "title": "المغادرة", "description": "العودة إلى أثينا والمغادرة"}]	{"تذاكر الطيران","العبّارات الداخلية","الإقامة الفندقية",الإفطار,"جولات مرشد"}	{"التأشيرة الشنغن","معظم الوجبات",التسوق}	استرداد 80% قبل 30 يوماً، 30% قبل 15 يوماً، غير قابل للاسترداد بعدها.	f	2026-07-10 03:33:00.167781+00
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, reference_number, booking_type, flight_booking_id, package_booking_id, visa_application_id, customer_name, customer_phone, amount, currency, method, status, transaction_id, paid_at, notes, created_at) FROM stdin;
\.


--
-- Data for Name: service_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_settings (id, flights_enabled, packages_enabled, visas_enabled, updated_at) FROM stdin;
1	t	t	t	2026-07-12 06:17:37.889+00
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
clnOSFNtVcqsouTtTD8bLutWAz2SMI4P	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:05:15.753Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":5}	2026-08-09 03:05:16
svakLu_4K9f0V6JWPCieQAZkyGFnTZ4m	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:05:32.278Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":5}	2026-08-09 03:05:33
RFc5HLmUq8FelJYWG2F1SXMTyD6KtX0X	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:05:58.909Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":5}	2026-08-09 03:05:59
aWQUyqf6uGcU6KXU6fNxKAqM-q6SRtbB	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:09:15.434Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":5}	2026-08-09 03:09:16
ZVjbncPPGASvEiczYDHq-byur94q_8Hi	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:09:33.014Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":5}	2026-08-09 03:09:34
X3J7qxMDfuEyvHpQIqFpqMKtoMhNpnIv	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:09:33.039Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":5}	2026-08-09 03:09:34
ZN6opVhN9uEuK2wPrZ8_hp3ASqS-Fq1V	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:06.797Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:07
1kGTnFHO1A59HDxu6fB89uO4D7WjKSdf	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:07.155Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:08
AjN4zUTNeSVvUnAssJ8IgYKKOgn0ep2P	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:07.706Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:08
7-DqbW_AGBmuD9UyIBTYYTLZgnU_PEK9	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:08.911Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:09
oeZTXb3v9ju-IAcPU_6vFlcV0lb2sG8X	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:11.104Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:12
5CPJAGOZEbyoLzj7YV0wnxCD8xqfgHIm	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:12.283Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:13
8STtYz0PyHnP04qAFVcW2s4xHovWuAsx	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:13.221Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:14
R0KxfY_bwjqO4CSrIOZcCJkagqyGE-Qp	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:14.420Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:15
EBI447QTZGNc-ykwhu5uWfM0fsPMTpRu	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:18.627Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:19
D5tO73eMBDRbsqtEdpGQvQUiyx_JZYLG	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:18.820Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:19
JbL4ne7IUbPU3PU3s5BKgFgDJBdIM4cg	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:19.003Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:20
6gFmCmJoPWvdfMkivO0A6HNM7CY-0BU4	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:11:27.222Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:11:28
qhInrTIhPqJW_DYl00anXsLaf1-LjRbm	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:14.309Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:15
K7zYohdkaIkbHbDmD3GUTnn_PoKZxACV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:15.521Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:16
sdasx5QImJ5ok_oG0Ta7GANoPQMIo-Dc	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:17.227Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:18
oFrBaBz1SGg0-FjR7my3JsPRPWvwBBn4	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:18.430Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:19
-FjJlvTcVaY9KN0oncviIPRhE0tcaPFF	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:20.041Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:21
Km1lqNbLfowRA9Ab5B2gylSols2WwWY4	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:21.235Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:22
4x-gijDyNoooQ7A2rD3LLyRUVeFDO-WR	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:30.521Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:31
9qU-K-d0nxZi0pNAbz2gBji2nkpz_1Lm	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:31.717Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:32
t1VRd2WVqyhJp4k00dco2fm-3Udd-TpL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:32.784Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:33
DhNaXCvjaJx46LdMTrpkTNxN1kqpG2ss	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:33.965Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:34
LzCTOW8mSTeC93mxYvKLooveU1a2Rkqa	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:38.938Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:39
BDElnXbgrCBkIIvju682aiAUizFSPsN7	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:39.112Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:40
0kp7OwGGjYJVuQ8CKBeF4skUJcnTTYrQ	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:39.310Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:40
xK3WELQYCfo7WOzNScDTYqoud-nFhQ5E	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:48.876Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:49
8OXDYaISTm88WSFiPpI02f9vmM0PLwz2	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:50.070Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:51
CaHKy3Qk9Ccu2ShN_xOduqSC1QD6SsXl	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:51.189Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:52
QvjghE5xIk2tkIh3Z3a3sWvi4Yd5Nkvd	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:51.568Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:52
qoFBa78W_zOof-Wy75mZu5W93OP2Nz3_	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:52.800Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:53
VZRWo08V3zYza3FGqmvBD1wXX2Ro1e82	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:12:53.595Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:12:54
xJzQXQyc8in60kjyPysk26OB4StaBhvV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:13:06.890Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:13:07
bs6jwhXhQWxWNqy7l2efKH6raRFAVaRx	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:13:08.082Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":6}	2026-08-09 03:13:09
P34BIBmxiem90GY2qrCHkmR1lcZW8i0G	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:35:44.796Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 03:35:45
ocdafN0R7ziOMTgHUmCTR3D3Guwgheh4	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:32.716Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":40}	2026-08-09 03:36:33
iOm_Jul0C8clQe6OcP3D64h-jQoB_-5Y	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:46.048Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:47
1mote1Yyj8zhAN5wpfupW7j_3sFpijqN	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:46.452Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:47
LpMjRs7CA6yE2fpFang8_lzWuPwJBvJg	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:46.633Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:47
nVw_LxafBI1ahNwxiHVj4vexvo3Koee4	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:47.091Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:48
xMsIUV9ZyL4vPEoa7YLWKSK3vjINCfaP	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:48.465Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:49
iC0qnXQYbIQVGAVaX7LArUouMX74EZFP	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:53.346Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:54
_RCzL5WXqpXvrih177p9WpOXBYOxjfKU	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:53.365Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:54
lZLCCXNPKSqeXh2g3prbw5nV20U-lMq4	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:53.533Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:36:54
4Jr4cmydy3w_Z2NuL2uGJmvUH9tWhIYa	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:36:55.785Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":42}	2026-08-09 03:36:56
L9c2Msc7gsbtcCVXUsMkV2kTSfBueY6o	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:07.032Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:08
H8pglCT77SxJPua6p_rRRZOfp8KF-aXx	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:08.226Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:09
LehA0bE1jFOCCqIdUJlAIHAmZTWhW5dr	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:08.349Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":42}	2026-08-09 03:37:09
oCF686pjJ_ZH0AHFV8jEuIxYEXRushCf	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:08.528Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 03:37:09
fBubTJlZUPy_hG8fTvBgDQnposnOWVV-	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:08.841Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:09
0TLTNkg-R6g0rRZTW4xJxia5Lxvfujpc	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:09.654Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:10
nJzPiHl1IiCiigrEncTA94TdhVK2reqD	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:10.861Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:11
SIH0W7xNs_unjAq4NL4UfTHDZ92Ub5HH	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:47.901Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:48
1JGi0c6WceEDiNp6XOmG2o3X8yO7jXsP	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:49.098Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:50
KKN44D0XKwKN7sxBoeE9oOuz0Gr_hMzM	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:37:56.988Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:37:57
SpWmCG7QP6YCxSNMZPiaUdpLnSL2kmGF	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:00.177Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:01
TueBLqDIVXL4ejG1E-OUbprEjye4oMn6	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:00.371Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:01
2jUO9gOq9D-yv1vhXHWOpqVnN2Z_XjnF	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:00.761Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:01
TAU-KUfbIlBi8bCR95y0CgAHbRFpzkx8	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:41.452Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:42
bZb7y2YEN2-B4wA6krFPuKpqBmx-oM-9	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:41.455Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:42
o452aE4wVDn8oufw2VpkfUxsaw-xb-Uz	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:41.469Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:42
yOgyHV9fo_2c3sQHEnVQXwHeBB9Fc6fb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:38:41.664Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:38:42
TtuDDUyAl8772u1I7C1FC6rD4yKMoQX5	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:28.257Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:29
0Urdvfqwlcd-7dpeWcZaL9TvkgAHZM0X	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:28.276Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:29
6S2iRWtMrTWPbwm9NScEzxxVXolSi0NA	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:28.289Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:29
IGQGtWjUHbw1o_--uONyDG3iowIAvpHT	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:35.886Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:36
qzLALeW4D-67chrmRceViOwQPzMdT2vc	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:39:13.877Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":47}	2026-08-09 04:39:14
0kTEPToWe98v4SVpxYWOjhkvrTX3IrNP	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:39:39.271Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:39:40
jdFHpsjKF-L_jVN3MNhnxvIVIa75DgDr	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:43:03.354Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":49}	2026-08-09 04:43:04
S-zKdPQrJruCUkXoQTqCVb6NWldrpdBD	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:52:17.568Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:52:18
olQEAehBdgYi4Ssi1joNZoE_S09DkmvK	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T21:03:56.349Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 21:03:57
q-V5mDTuG5QZKJPNoUA4k2bQM6XO4q5p	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T21:52:15.385Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 21:52:16
tsXYzG34foc1ODwphRAMQ5rxKuPrj3zH	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:32:54.482Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:32:55
CH5Rb299Rl1E40Qt8WXOsFCMkjvQcUpX	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:38:40.826Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:38:41
ZcO5buw1aPpNuXzONDJI_P2VQKrcQMdR	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:35:13.597Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:35:14
2i2FBmxtEOh8JemovZ3nCuudSLN1p0sw	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:28:05.280Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":58}	2026-08-11 06:28:06
pT-b-ey9lsXh8veCW6U3a6hnDB1r78g9	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:01:52.538Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":50}	2026-08-10 01:01:53
yzGp2ApFNYCI-RuNIN0OKnD_4abVdAr5	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:01:52.982Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":50}	2026-08-10 01:01:53
QS9OkpKpk50lA-unISB-0TiJhV9z7k44	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:01:54.901Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":50}	2026-08-10 01:01:55
lWPobyPFI3kCtjYutaS-FiD-uky4A5Ag	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:02:06.107Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":50}	2026-08-10 01:02:07
Vqqmo2KPZxspYh5rx_019CHbUP50mgaU	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:36:02.582Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:36:03
7NipskxPnN7yZHl9ikiN0CNQyHZKEoIw	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:31:08.913Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":58}	2026-08-11 06:31:09
lQIae47TJLm1sECAkf_QoiBd7h0tHdVI	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:31:08.933Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:31:09
eOK6STZqVmRGf7IoHOGrHiGy7MWU-aRY	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:41:55.888Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:42:55
Eki-1pLWF_gH1gchPYVIttY1xj9TDicn	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:34:27.967Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:34:28
1hyXba-nyMkvEPBa7MnfJU93ryp4Tzin	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T07:36:04.952Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":56}	2026-08-10 07:45:20
3P91xmGe5MnIrSD57PGaEwwYg3oBUJHT	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:35:06.689Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:35:07
iFGnTUr5Ik1z8dKU3Q7iVW6mLbUFZ__6	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:19:07.278Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:19:08
OhonwrAsX2sY56s8uYuK8M33WwYpr7Vz	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:22:41.414Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":52}	2026-08-10 01:22:42
Io4RIfFFHKtk8DZxzgHNAZSlNaf88SfW	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:22:41.557Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":52}	2026-08-10 01:22:42
-Z_hTMNkxG6N6zJWYSXeiBjaCqRsbSVW	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:22:41.630Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":52}	2026-08-10 01:22:42
yixKKSqM5kGGgCJfAgNGKJ4C-ApLJJaB	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:22:43.753Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":52}	2026-08-10 01:22:44
VuunlrpJ5iaCMIV_XQxujERa720HHcRb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:35:06.712Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:35:07
hmZanFsgjOl3yW6nLgcz5gycZyB5zYfP	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T07:16:02.399Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":55}	2026-08-10 07:16:07
inLQzbCPjAyrcsxDcTbZivdk4Ag-rYwK	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T03:08:48.710Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 03:08:49
h84F8ZEcsM7WPaRLfypDvxO7DPlPRZ8H	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:29:51.440Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:29:52
WIisdveOT0tFle3Bu9H6lNp7JSKTg8Bv	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:29:59.599Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:30:00
jDKa616F0TLBoGYrVKBtGj-GoiQbb-Wc	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:32:06.945Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:32:07
rgML0jxQKBG9H3Zg98aMTnxAaTdMS4qp	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:35.895Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:36
usdjejxjqwE8p8Dmio8-LWpDbCxa8tCV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:37.132Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:38
fb8gG6ApONI2sYPRcPRNW9ex817wKtnL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:37.261Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:38
32BzVWsyNTPnSmjYAA7TbpAbCs5EJbcY	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:39.246Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:40
TBwnHla517MXzWpDbWvclVcIDtvJ67IX	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:40.109Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:41
zIldWFAPfi9FOgoCox_fSSflHI-b3i9T	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:40.819Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:41
hDktEVj1ov9baRafGBWuDnvNins7XUEn	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:41.228Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:42
8nAjSNBj6worRBu0h_hfbsuP1NXT59sp	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:42.880Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:43
8YFqrqqfY5vmdXQZIxd6Ak220rqASoeX	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:39:44.062Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:39:45
JORqwM71XPvSoRqNK_9_CCbpo88AIHVH	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:41.929Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:42
KOhYhPIAgkZQ1d-VRY_5MRF_s2ewUDsJ	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:41.939Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:42
SK3GCrDAhhZTH2q5sSJpFqCssAWh2_eq	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:41.941Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:42
abeoHHICjyJWdtWgUepN-n1NakqjnCjZ	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:42.122Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:43
pAyzmpaPb71xbdnLlxCbx20Lfztl3I2T	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:43.306Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:44
QBE1qoSxG6avE6DitX5T_2MRRmUJ43YU	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:43.318Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:44
OTjcwGFYJW90nq3WKP33GHZv1L9HeKPd	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:57.026Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:58
USsG58t3tiUU5SiwXkV5A_a-QjJGN2R0	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:40:57.034Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:40:58
dr5sqMtsPHhvaILMaixJA3Q61j4jpSqG	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:43:18.557Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:43:19
NT5SC8oJhXVi4uHPfkCDIWBE_yl5QxXy	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:43:18.574Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:43:19
-cxXKSm8o_RhW2AO4OCN_I7jvFZcmIvy	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:43:18.582Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:43:19
B8BdDeW0UEHUbJdH3JhUqcKDdsiequT-	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:43:18.812Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:43:19
lAJAMAVZm0uJUGUMFBV6HwOnGBaysdba	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:11.091Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:12
nbjq9HJB1_28Kff8yu_tEYu00HhHz47g	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:11.445Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:12
89orie31UDuC4QtIx23PE2L3TScwraND	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:11.472Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:12
NaE5BfndQQhqnNn0gWe0mNbijvNPkxzL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:11.911Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:12
ipl9xOXvkLXNfYbgfDPbAfHHXAa7qd7W	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:13.272Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:14
RgjITdmfXtkum8wBuR9DkNhH3kWYjw1C	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:14.570Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:15
T7jLC9QT6wOlhUeZpnZGp9HQ-NSiPF4s	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:15.194Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:16
QjRS_WAv7cEoF4UjoTkDD_dLYvlf-40_	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:16.099Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:17
gfivgGyd34TYamlhPmFPBs9p0XH7VLyE	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:17.321Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:18
lYAcmMlaRvjUdag2iXikoSHv5n7-mUI7	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:18.265Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:19
CMtna_Jdzfs8OSGMRsZSJGYrphr1SaTb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:19.360Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:20
IPMxfOuNxY9eupvqHYO4LZcclaI61yOk	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:20.557Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:21
RGfe9agy0Ssy89Yp9chdbNDaPcCbG3G8	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:22.713Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:23
ivUpQ9TFq41AdekMJRml-8d1YfqwVtgA	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:22.740Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:23
test-session-qema-1783740800	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"userId":53}	2026-07-18 03:33:20.795175
8VMso4iDlPUuD8SSwGE8NzwbfrfDx1xe	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:22.740Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:23
KSWP1uRGHM23ysZjq-jXSgowRDWx6CE1	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:50.848Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:51
vkM6XurS3S-0MHVP4DZ3XavaDYPJTiet	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:50.863Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:51
3IXj_pSxjtsFpbSZWlZIAUeACiDPP3pU	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:50.891Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:51
Adl0eFYIIKEETgRDZp8GzKx_SrlFXS-t	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:52.043Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:53
ya8_0nnGHhImozRtuEdvy3EptWV4MrlL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:52.259Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:53
m2id8oElbWP22icTWH0VvdyPHnU1m2Cr	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:57.021Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:58
zOWiw4nbuMyznX_yJbLTd1pmY5c12c6h	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:57.030Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:58
SCRB78JjraBr7HShJ-VtLA-p0dElaEpW	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:58.218Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:59
xaT7lE0SdSz10gT8-i4MQGc9jOIwXxh0	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:44:58.382Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:44:59
K1itd4W9mLXGIp0ceim1RapnyvW45nIR	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:34.867Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:35
JOxHAWZLL3XXiL_UrieoIg0ElXp2BVUP	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:34.873Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:35
DEigy5-rIofQlHxdBsjISUpjBTwJAYC-	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:34.880Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:35
eU50qzdfkhVGuLsG-qMxZVK98Z7_cVii	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:35.079Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:36
WxUkKQN0cHt3VNxlJhr-JNWlsjUpt8dk	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:36.274Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:37
UXEvz9IqTQWR-gjifwCHiDVux385JYDa	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:36.290Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:37
3KapuF_eAXMOyGyjvPDrcfbwmQZPWULK	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:43.012Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:44
FamCEHsrGHIf65DyCPv17yg5qJIpAJE2	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:44.218Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:45
3jCnZaG-gk6_ywwjFF40NmjnoswzzsY9	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:46.496Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:47
R-GEyTfvWl4fEK-M_UTC-9knnCn5T364	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:47.695Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:48
b_V6QkRx7x9lQ7DsXoLPZ4eTknVJ4tPI	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:47.736Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:48
wfNVyud-EwdEy2JFtVo6xxSWmjS8PDEL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:49.110Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:50
j4BgtvzXZnAy7LatK12Y4FRhf7uR8emi	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:50.815Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:51
5WIMSP9ZQciGxPmDQ-eGCZZPZzAjVEoq	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:52.009Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:53
nvb_HzYvkeDvVk6RoLj5fxvWyiOhjGJb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:53.135Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:54
-iU4GVo6Ijbxsv_0u6yHY-vGsx61kXYw	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:54.518Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:55
TXjLMwNNztBhZO65nZBGOe48bGq-yAdx	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:55.640Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:56
kuhatB7ymyf1i8Bz0mj3aqeMsZDyXqQd	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:45:56.846Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:45:57
FpYGb4PDSUWc2TdzXkQLWnyhaYj2dGxx	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:14.181Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:15
bziImvuf15GwieTfxHwC0W5VK4kzv5vy	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:14.185Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:15
9vfMMkWYjz-4lmCU8eqK7My0L0vB9AxV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:14.396Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:15
Q1Aq8XjZ9EQOPiqqknLuETHuK-d75MgD	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:14.423Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:15
drq2c6mgb2y7k6iFGs4tRlbxf1GdAqHB	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:14.600Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:15
JUEqPNp1ECZCBPgjDfVdIKww6x2zhzQ6	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:15.629Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:16
sS9Vl9Wc-jAQ-okjB63GqC0ggq4BXMJ2	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:15.743Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:16
g5ECCNVBp3P0co55sxNj2D7ZaKamFh4W	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:15.793Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:16
tzPNhlYXgDlcrVueb1dtyI1XWyhCdLe0	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:50.935Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:51
DJNVjyVPg1GsEdrkC9mDcSDWp_lG_fDl	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:50.946Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:51
R7z_igzAD96_Fhr07gt4GMHoHEZcRUtn	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:50.953Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:51
eS_D1D8ugSiCxeWFwu08OTxBTzxeF6IS	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:48:50.958Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:48:51
IrInv_rG1pSJToRO0gCK2a7Vp1H4sOys	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:07.280Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:08
107i39waCXkJZDyZ4ZkvkqQUF0UIgXoh	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:07.280Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:08
Syp8XDPMA3auXDXWZClkpYsi1Iko7z_o	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:07.299Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:08
QX5ww3LK8jsVk4tXSCFYI8ITDSeUkojf	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:29.271Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:30
_SNvN4ZIe8MJAHZX_WLKF-9Xh_JfpB5h	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:29.276Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:30
9nLCHPkKDP0eGVyhQ_KQRtSdn1AINu7h	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:29.277Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:30
Mo2Z4Cue9ddWZAp624_Eed52mp4wdROv	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:29.282Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:30
OwOmPEe-CDZEKCI2f66NyBoSSBkpLZpG	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:29.441Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:30
1E1OWlNFk0FeBRzvSq8Tgqy41l3LQ22U	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:38.357Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:39
49-40dCmgc1CgD1gmdBumhMzkfk64wzh	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:38.374Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:39
Z_rHw7CG5iPm9PsqxMSSh7mPaMOhCmzy	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:49:38.377Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":41}	2026-08-09 03:49:39
rOeAc0GTqGtUR9ezO8GclPrBVqQ8ttPz	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T03:55:00.191Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 03:55:01
jhUp0jZkK3V_RVt5noDUz9E8Oiwk4rGB	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:00:54.183Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":43}	2026-08-09 04:00:55
FgGKeTLeBIuLXVf3RTcis8dZckJY3uny	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:00:54.270Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:00:55
153evFzwjHkmC1kiEU8v026fes1rKPkk	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:02:34.192Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:02:35
O35lYDRyNo1H-PxJHLd1-nBG1-yTt6eS	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:04:42.370Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":44}	2026-08-09 04:04:43
Tsf2Jym0xZeXAeHXdMh_8mIFbrNqW1eO	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:04:53.627Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":45}	2026-08-09 04:04:54
ynAYX3GYWDEtZpvAMQv4pcVkgQjHyl0B	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:04:53.706Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":45}	2026-08-09 04:04:54
fqLpoh4NGCd0_xR33STIoDNRWnuU-4eC	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:05:40.036Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:05:41
CMAs7u3LeCfI-SkhyLN71JmsEbGSkCXB	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:05:40.413Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:05:41
V5HyqRpbeAxWfP81hK3iivaGFVVcCkFb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:05:40.842Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:05:41
_4iF2HcONhBwgqcYr2RFostRSu4tljFS	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:05:41.066Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:05:42
kzqtqCiQr46EUe9LGCbHJRptrs0yP3R1	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:05:47.671Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:05:48
StM6DWhKZs28qgQ7MBDn_FuR0gc7xSk8	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:05:50.368Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:05:51
DJzDE2hnFZzSMKli5Y4EaA14be83WUlV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:07:21.024Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:07:22
uzeaoV5621_m4HBBF15DHBpIrOOOiI3G	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:07:21.193Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:07:22
qg4lP9IKjLdMKWAEA7mjPjCug7ABlXh5	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:07:21.379Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:07:22
k5Z2OsJbU4m1y7v6DOE29dUvzC2xZKle	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:07:21.525Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:07:22
2denRYjQ_zXqWCts2cu8sbAmjUYN0CB5	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:07:21.552Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:07:22
uLanUHWYldmal6J2yLXQXMjp6KD4-hes	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:07:53.714Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:07:54
ruyJOTJla7cAJNmq2Ju9cSg77na6eZSV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:04.820Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:08:05
xfCEwbJHF4XzT2cVDlh5EdMFqGdxs_gX	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:14.645Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:08:15
CFaXNRwOeqvzFb9_Ula3jLsCyaYpo9kF	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:24.313Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:08:25
5npV4_fRYvJP5dXzbsgO3Y-mKN3d5GNL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:24.326Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:08:25
x6UsNKi0EQh1UfiOcFbwqp9Io3gLLzEV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:24.500Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:08:25
PrX9JAW2TMaEctZ5P-V9hPWWqAK5t48I	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:24.507Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:08:25
UW2c9SLJqs0pmxJkcfAm1_oe5iffDP7i	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:24.651Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:08:25
g8o6Ub4YPWWDO8VOhoXmHZeaELuUuX85	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:06:05.252Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":51}	2026-08-10 01:06:06
l_Je-wLZwVDO2T6JBzqTl_RZKKh0CjxL	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:06:06.139Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":51}	2026-08-10 01:06:07
Y6YwLXfbUrec8jjfq4iEPVyPlOB-9CsI	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:06:11.791Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":51}	2026-08-10 01:06:12
6MwDpKT9nDuMBPQL793TcQaS9Ag3DRS7	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:44.352Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:08:45
PI-bcaBAQCG2KebUKFc8OP791jHEtxAi	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:44.434Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:08:45
nIX_jDpyHCKncjHC3hc5L6YCWmk2GawX	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T01:06:15.662Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":51}	2026-08-10 01:06:16
RF36WtAV0UjH3QSN86hFy_F3XJe8sgtE	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:30:16.257Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:30:17
fYzkaziPJUo6PCIgJbKzXYfb34A70PF2	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:34:34.993Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:34:35
e8rRh3sYlg4qw9F0yhl9HY3ttmVwDl1G	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:39:14.040Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:41:08
z-sB1Qma7GoZl6xavqKJ5lVaYi4WcJwh	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:08:52.716Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:08:53
0O3ruGnIgA_xuTnytpc27vrPjPEObnCv	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:59:43.907Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-10 03:59:44
VIaSCtNu6H3l9GJo6nPGUARb2Emd2F3i	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:37:22.451Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:37:23
xBMmilPTlI109uNyq3CSaxD6AnJVfiXl	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:41:29.909Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:41:30
bf3RRDxDAIMjM7lhaFy1sa2u9akoxILx	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T03:35:48.699Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":53}	2026-08-10 03:35:49
eg96LIg0bGunpf_gqr1s0-_-zZ4pjP0X	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:15:45.645Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":46}	2026-08-09 04:31:10
csi3Ls6O4CG92mooTCWxiZtTYPjCDU3A	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T03:49:13.311Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 03:49:14
UHpOeTSikdrPWc7pumQWNHxSISrgntfS	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:57:08.138Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":48}	2026-08-09 05:17:37
SehKxWdmoubni09uTLLObxc84HJYvYR1	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:31:08.604Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:31:09
8BRi5I60oiGUzJUZRQYcTBad20PPUQMc	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:10:32.884Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:10:33
WxHDyU4ugQd1l9CPAoJxKUWKuV3dYR3_	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-10T07:58:04.594Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":57}	2026-08-10 07:58:19
rdgiPYshTSij6mvVYjlQAy9dzUtApX9_	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:10:36.386Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:10:37
s-QNYfBK8-PUyByfUT5YYrOr4C5-i6Ph	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:31:08.782Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:31:09
3E-sEVBJz5MCdoDVtyQR9SmPvCp2iFHY	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:53:04.525Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:53:05
JYwuIdWXBjh9U7LZFqHKWv6F9_xi4KCR	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:53:13.648Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:53:14
AW-tPFZSy2K0Svd2wKtYJmtK5ATdx5nb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:52:00.495Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:52:01
8BqRPX-cneCd-jewesG0m8aqYPlejWDb	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:16:34.840Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:16:35
A3kLWAvch42OyVn4tHgcyNDpuNVnxpS9	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:17:35.325Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-11 06:17:36
WDLgx0yvoo5VyTL1-2x3kA4ppnCxAfFo	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-09T04:16:37.221Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":4}	2026-08-09 04:16:38
GwexK8dNConW34nokDZy2ZaV1JbC9FyV	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:29:45.460Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:29:46
32RA_Ctk9eAPQvmDY_BI8PBdEdx4amF2	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:29:45.506Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:29:46
IRbWBZkoyyiVfHWNTL_Q6sOt5WGcUhn1	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:31:27.720Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:31:28
mOpYsoVBOx5TCEDA7-qhrcc0P6zZbMvA	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:31:31.537Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:31:32
-zNwpEhVeXoIpel6mLqFU9qFSCdF3cwR	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:31:31.599Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:31:32
cvSMNIjMaa6RX5sm1q_-Fp8TIAZeu-AM	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:32:38.968Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:32:39
xHwNr2Km6Oq0PBtWF3MtKxGMVO_FbGuq	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:32:40.843Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:32:41
GRQVR4jfx_L4u-VE5gyid4rXTwYndGLl	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:32:41.505Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:32:42
2xPDSXA3sRaN-JVtKcmjAiLKeOdqXyEo	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:33:15.390Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:33:16
08Z2pcBJIu6d-JqTDYtO8Ix-MhveDx4k	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:33:17.079Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:33:18
SzKbVc499Eg-dKjATTNN_cfxtcMqddy0	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:34:08.270Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:34:09
CesZ4Co7ShO46elmxIxzuq6gSgqzKOWi	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T06:46:49.869Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":58}	2026-08-11 07:26:54
tEJr620p7AXdtcy0xp9x85p-cTUMvwnv	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T09:57:59.629Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 09:58:00
AZQk_icFesSe5udHlEd6Pekw6id-gkBM	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:34:08.602Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:34:09
fxDPUyWebYo8xuEoX-0NxnxvDKrsu59F	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:34:09.907Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:34:10
IhA64noDhRpq-OAYpqnt-9irlxUjBmbe	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:34:34.617Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:34:35
kQCoGFWN_Hb1NS1cIZn-a5tIgpLzF8hW	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:34:35.106Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:34:36
L24Q0cNs4TXwxeS9XOcglCYUjkcDQLRD	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:35:14.016Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:35:15
C12hBGHRDYNvRzNFkmEjMPc4G2sZ0dhY	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:35:15.725Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":1}	2026-08-11 22:35:16
gHzTXQMyRmjIGZgtoOsZnuAROX8NLalf	{"cookie":{"originalMaxAge":2592000000,"expires":"2026-08-11T22:26:14.513Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":62}	2026-08-11 22:53:22
\.


--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testimonials (id, customer_name, avatar_url, rating, comment, created_at) FROM stdin;
1	Mohammed Jasim	\N	5	Got my Turkey visa in 3 days, super smooth process!	2026-07-10 01:29:35.427575+00
2	Layla Hassan	\N	5	The package to Georgia exceeded expectations, great hotels.	2026-07-10 01:29:35.427575+00
3	Omar Fadhil	\N	4	Good service overall, communication could be faster.	2026-07-10 01:29:35.427575+00
4	محمد العبيدي	\N	5	خدمة ممتازة جداً! حصلت على تأشيرة تركيا في أقل من 4 أيام. فريق قمة النظائر محترف ومتعاون وأنصح به الجميع.	2026-07-10 03:33:00.179862+00
5	فاطمة الجنابي	\N	5	باقة دبي كانت رائعة جداً من أول يوم حتى آخر يوم. الفندق فاخر والخدمات مميزة، سنعود مجدداً مع قمة النظائر!	2026-07-10 03:33:00.184985+00
6	علي الموسوي	\N	4	تجربتي مع طلب تأشيرة ألمانيا كانت سلسة ومريحة. المسؤولون كانوا يردون على استفساراتي بسرعة وكفاءة عالية.	2026-07-10 03:33:00.187066+00
7	سارة الراشد	\N	5	أفضل شركة سفر تعاملت معها في حياتي! رحلة ماليزيا كانت حلماً أصبح حقيقة. شكراً لكل فريق قمة النظائر.	2026-07-10 03:33:00.188951+00
8	حسن الطائي	\N	5	احترافية عالية وأسعار منافسة. تمكنت من السفر إلى اليونان لأول مرة بفضل مساعدة فريق الشركة في جميع إجراءات التأشيرة.	2026-07-10 03:33:00.190668+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, full_name, phone, email, password_hash, avatar_url, role, language, currency, created_at, first_name, father_name, grandfather_name, family_name, english_name, gender, dob, nationality, place_of_birth, marital_status, occupation, whatsapp, address, passport_number, passport_issuing_country, passport_issuing_place, passport_issue_date, passport_expiry, passport_image_url, has_gulf_residence, gulf_residence_country, gulf_residence_number, gulf_residence_expiry, gulf_residence_front_url, gulf_residence_back_url, profile_completed_at, active_visas, travel_history, has_travel_history, has_active_foreign_visa, residence_type, permissions, expo_push_token) FROM stdin;
2	Ahmed Al-Kaabi	+9647700000002	ahmed@example.com	$2b$10$hL3rBwy2Sj6X2TMSuxl9EuAxU4I0qcXnttAyhqC590CH1iHy2ZnXS	\N	customer	ar	USD	2026-07-10 01:28:43.214891+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
3	Sara Mahmoud	+9647700000003	sara@example.com	$2b$10$hL3rBwy2Sj6X2TMSuxl9EuAxU4I0qcXnttAyhqC590CH1iHy2ZnXS	\N	customer	ar	USD	2026-07-10 01:28:43.214891+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
5	Test User	+9647801234567	\N	$2b$10$pbSbft79ql4XmiuGDoW6ouif.sqHffMoUFvbRt05iH4KtW3Ot/1hG	\N	customer	ar	USD	2026-07-10 03:02:54.437717+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
6	نمجخيلم	+964779055522	MMM@GMAIL.COM	$2b$10$1zRV42G1uPh33ArhkUBe9.thXDLVn0u0yQf3/zKZYJkraW.71s.Mq	\N	customer	ar	USD	2026-07-10 03:11:06.768711+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
40	تجربة	+96407700000001	\N	$2b$10$gEeLwePc11xP4h/kHOlbUOSF3qiXf.pD4KQpnLKK8qTDy6U.LLLXa	\N	customer	ar	USD	2026-07-10 03:36:32.710808+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
41	mohammed	+9640779055522	mmm@gmail,com	$2b$10$UZRY9N3m/Ceqad0P4iQRWO2UVPJaai69BA7tLZODogzyFQUkvXIWW	\N	customer	ar	USD	2026-07-10 03:36:46.044679+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
42	أحمد	+96407750000000	\N	$2b$10$/wVk7lFVMtM2Q4BQzqzsBe/nLqDMdgpl2qLXxiZwxzcvHEuno8Qe2	\N	customer	ar	USD	2026-07-10 03:36:55.773074+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
43	Test User	07701234567	\N	$2b$10$z8J2q1Tuwrfzp4CCiPhGkufNnBHz6Z6oRTJl1xWaCB3/psJLWIM1m	\N	customer	ar	USD	2026-07-10 04:00:54.144447+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
44	Test User 2	07701234599	\N	$2b$10$RcUlyWwCK2QRJH0Z2ztOBuE618ilywFqLmpO2PuwKxls25Y4zpAGa	\N	customer	ar	USD	2026-07-10 04:04:42.334499+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
45	Test User 3	+9647701234500	\N	$2b$10$UojY5.kSJ9H4dnzWfBmLUuM0w5LlfxGSd0NAIKQOPVvaCO7zbzwre	\N	customer	ar	USD	2026-07-10 04:04:53.621734+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
46	غتعغ	+9647790555222	alraqalkwyt450@gmail.com	$2b$10$g4zVBPxqQ5nzG9GCInmYruDMTaDgJmOPKlaXMyJ908xuzgpSXVOtu	\N	customer	ar	USD	2026-07-10 04:05:40.03049+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
47	مستخدم جديد	+9647901112233	\N	$2b$10$x2BldV8ESn37XVeFXTA.ee3oEAuKXEBMrf6d6HlAd4.pGD5ssRhWW	\N	customer	ar	USD	2026-07-10 04:39:13.738518+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
48	منتح	+964779000506645	alraqalkwyt226@gmail.com	$2b$10$hDDxHlkdGAaQRI4Gx3eFgeaBW53VYhe9kilXB8Hi1.iYIf/8JANWC	\N	customer	ar	USD	2026-07-10 04:41:07.003302+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
49	اختبار	+9647500000001	\N	$2b$10$jyoyegjybjSRykCcC0UKMOsN8bGRPz/1Eora0suY/GMZQV6gNI/wG	\N	customer	ar	USD	2026-07-10 04:43:03.349999+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
50	Test User	+96477007789	\N	$2b$10$JhMF8gLzasT/VtYnevcnNuMPu1qo1xHBvCkJ3MoMvbYPGW0eQ7/rK	\N	customer	ar	USD	2026-07-11 01:01:52.39153+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
51	Storage Tester	+9647714585119	\N	$2b$10$r5uIA3nj287njlkWbLxOguk2s.I.3b/NFFDCWWNZlpCISqdBZcfIa	\N	customer	ar	USD	2026-07-11 01:06:05.245736+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
52	OCR Tester	+964771840248	\N	$2b$10$UnUHLGcKSPjAJz9TNpqg2eB7pxB9QO6TiczKId56uLUD34yef0zNO	\N	customer	ar	USD	2026-07-11 01:22:41.374424+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
53	مستخدم تجريبي	+9647799111222	test@qema.com	$2b$10$zHb5RaNRwJ0rZJnFz26WBO2JsmD2skyx41nY5Tlx0apecimEFRvja	\N	customer	ar	USD	2026-07-11 03:29:51.430535+00	\N	\N	\N	\N	Mustafa Test	male	1990-05-15	Iraqi	Baghdad	\N	Engineer	+9647799111222	Baghdad, Iraq	A12345678	Iraq	\N	2020-01-01	2030-01-01	\N	t	UAE	UAE-12345678	2026-12-31	\N	\N	\N	[]	[]	f	f	none	\N	\N
4	ع	07700000000	admin@qema.com	$2b$10$UMco2/AwF217hUEFzpC9kOTk8YS2qM3LVrtfC1QMemEO/VVMlMhme	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/96e76565-4108-4f33-b582-92176de69e48	admin	ar	USD	2026-07-10 02:13:02.236187+00	\N	\N	\N	\N	RIYADH SUKKAR HUSSEIN ALBAKHATERA	M	1968-01-01	IRAQ	BASRA	\N	\N	\N	\N	B19330517	IRAQ	\N	2024-10-24	2032-10-23	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/3db499f0-1dff-4fce-8093-dfad84111055	f	\N	\N	\N			2026-07-11 04:43:32.754+00	[]	[]	f	f	none	\N	\N
54	ghmkgjk	+964778804544151	alkwytalraq712@gmail.com	$2b$10$I9ds5w8dyoPL8CSTFLcHletsu4PsUvugI.7ZcjS69S3eGh4mh.c86	\N	customer	ar	USD	2026-07-11 06:39:28.931841+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
59	امين	779055511	amen@gmail.com	$2b$10$avDNw4K3LwV/hmBI5xA7neni8EsSNG..yJJSUmNWQ4Nou1XWfPnhO	\N	staff	ar	USD	2026-07-12 03:18:41.15866+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	["visa_applications.view", "visa_applications.create", "visa_applications.review", "visa_applications.update_status", "visa_applications.upload_files", "visa_applications.add_notes", "visa_applications.issue", "visa_applications.print", "visas.view", "visas.create", "package_bookings.view", "package_bookings.edit", "package_bookings.cancel", "reports.view", "reports.export_pdf", "reports.export_excel"]	\N
61	اغن	779055511687688	amen@gmail.com	$2b$10$mEl0xjscsphidO6L..HwWeoHCtLNEXb4Laq5SBWuhpvj4r3m2feUu	\N	staff	ar	USD	2026-07-12 03:45:26.110314+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	["visa_applications.view", "visa_applications.create", "visa_applications.review", "visa_applications.update_status", "visa_applications.upload_files", "visa_applications.add_notes", "visa_applications.issue", "visa_applications.print", "visas.view", "visas.create", "visas.edit", "visas.delete"]	\N
60	امين	77905551168768	amen@gmail.com	$2b$10$I.mQm3wHMP68V0wV6BrxZet1nHgf0QEmpHlFD.LIP/DNQdAAWA0Om	\N	staff	ar	USD	2026-07-12 03:19:02.672426+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	["visa_applications.view", "visa_applications.create", "visa_applications.review", "visa_applications.update_status", "visa_applications.upload_files", "visa_applications.add_notes", "visa_applications.issue", "visa_applications.print", "visas.view", "visas.create", "package_bookings.view", "package_bookings.edit", "package_bookings.cancel", "reports.view", "reports.export_pdf", "reports.export_excel"]	\N
1	Admin User	+9647700000001	admin@qema.iq	$2b$10$PBhCucrH0N/MJMWxsv/EGOVAVnWMm1sox3YMEw7qXKhcUdKM6IpjO	\N	admin	ar	USD	2026-07-10 01:28:43.214891+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	[]	[]	f	f	none	\N	\N
58	تخة	+971558729925	owus711@gmail.com	$2b$10$rNS9Gznefpj9HElCxXv2Peq.ahZDaLWoTEv6coCAwBD.hYKyCiMUW	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/84f969b7-28eb-4842-bef8-2603403ee33f	customer	ar	USD	2026-07-12 00:29:06.145749+00	\N	\N	\N	\N	ALI ADDAY HADEED ALSHAWI	M	1974-03-06	IRAQ	BASRA	\N	\N	\N	\N	B14067601	IRAQ	\N	2024-06-23	2032-06-22	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/fbfb25ed-c4ab-4d5f-be7d-320f70d2aa45	t	\N	\N	\N	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/105178a0-da71-46e3-bb9f-f228f6bcf1ce	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/95090aaf-bdca-4e24-b3fb-24b361cad419	2026-07-12 04:30:12.096+00	[]	[]	f	f	gcc	\N	\N
62	محمد	+966558729925	ahyhyorv75@gmail.com	$2b$10$zT.CAGsg126eUn5n3yizse8afzEBzYZBe7mmYU18GsOOSY.jbB7i2	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/57d85a29-dc2d-4716-b4cd-85cd783f513f	customer	ar	USD	2026-07-12 22:26:14.48591+00	\N	\N	\N	\N	ABED ALRAZAK WAKA	M	1976-01-06	SYRIA	DEIR EZZOR	\N	\N	\N	\N	N00672839	SYRIA	\N	2023-12-06	2029-12-05	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/2f08299a-6a71-4247-b598-c5d1f2e26ebb	t	\N	\N	\N	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/f36dac17-335a-42dc-b620-677f7e1decfe	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/a02715f9-7f9a-4458-b80e-7ec15800b79e	2026-07-12 22:49:30.571+00	[]	[]	f	f	gcc	\N	\N
\.


--
-- Data for Name: visa_application_consents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visa_application_consents (id, user_id, visa_id, accepted_at) FROM stdin;
1	4	1	2026-07-11 02:19:12.504192+00
2	4	1	2026-07-11 03:11:56.823962+00
3	4	4	2026-07-11 03:12:31.619591+00
4	4	4	2026-07-11 03:13:13.671951+00
5	4	1	2026-07-11 03:22:24.709585+00
6	4	3	2026-07-11 03:25:41.041198+00
7	4	6	2026-07-11 03:28:00.919239+00
8	4	1	2026-07-11 03:53:27.090013+00
9	4	7	2026-07-11 04:00:08.635208+00
10	4	1	2026-07-11 04:06:48.906366+00
11	4	7	2026-07-11 04:12:05.271444+00
12	4	2	2026-07-11 04:22:25.90791+00
13	4	5	2026-07-11 04:25:45.056369+00
14	4	1	2026-07-11 04:36:05.400025+00
15	4	1	2026-07-11 04:40:55.116109+00
16	4	1	2026-07-11 04:41:30.786036+00
17	4	1	2026-07-11 04:41:41.928579+00
18	4	1	2026-07-11 04:44:02.193341+00
19	4	1	2026-07-11 04:47:12.749769+00
20	4	1	2026-07-11 05:46:54.590262+00
21	4	5	2026-07-11 05:47:20.450796+00
22	4	4	2026-07-11 06:01:10.595089+00
23	4	3	2026-07-11 06:03:05.38739+00
24	4	3	2026-07-11 06:03:17.194987+00
25	4	3	2026-07-11 06:03:41.141876+00
26	4	3	2026-07-11 06:06:09.541567+00
27	4	1	2026-07-11 06:10:28.040199+00
28	4	1	2026-07-11 06:10:49.201001+00
29	4	1	2026-07-11 06:11:03.71841+00
30	4	1	2026-07-11 06:36:00.739409+00
31	4	2	2026-07-11 06:48:00.575765+00
32	4	2	2026-07-11 07:11:40.332647+00
33	4	2	2026-07-12 02:30:09.932384+00
34	4	2	2026-07-12 02:49:34.789945+00
35	58	2	2026-07-12 04:30:24.449016+00
\.


--
-- Data for Name: visa_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visa_applications (id, user_id, visa_id, reference_number, full_name, phone, email, nationality, passport_number, passport_expiry, dob, gender, occupation, city, passport_image_url, personal_photo_url, status, created_at, passport_type, issuing_country, passport_issue_date, place_of_birth, mrz, ocr_confidence, ocr_verified, status_history, requested_documents, additional_document_urls) FROM stdin;
8	4	5	VISA-MRFY05YN-7LQTQ0	عويس	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/c0ef9fb9-1579-418b-8cef-4d1136861d1f	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	rejected	2026-07-11 05:47:20.495697+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T05:47:20.495Z"}, {"status": "reviewing", "timestamp": "2026-07-11T05:50:39.242Z"}, {"status": "processing", "timestamp": "2026-07-11T05:51:33.905Z"}, {"status": "filling_data", "timestamp": "2026-07-11T05:55:06.783Z"}, {"status": "rejected", "timestamp": "2026-07-11T05:58:20.609Z"}]	[]	[]
7	4	1	VISA-MRFXZM64-B16XQJ	عويس	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/c0ef9fb9-1579-418b-8cef-4d1136861d1f	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	cancelled	2026-07-11 05:46:54.845249+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T05:46:54.844Z"}, {"status": "reviewing", "timestamp": "2026-07-11T05:50:42.806Z"}, {"status": "processing", "timestamp": "2026-07-11T05:51:37.169Z"}, {"status": "awaiting_documents", "timestamp": "2026-07-11T05:55:10.688Z"}, {"status": "cancelled", "timestamp": "2026-07-11T05:58:25.774Z"}]	[]	[]
9	4	4	VISA-MRFYHYGL-NDM8ZM	عويس	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/c0ef9fb9-1579-418b-8cef-4d1136861d1f	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:01:10.582908+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:01:10.581Z"}]	[]	[]
10	4	3	VISA-MRFYKF0Q-QH2VFD	عويس	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:03:05.355838+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:03:05.354Z"}]	[]	[]
13	4	3	VISA-MRFYOD4H-UCLWSX	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:06:09.521839+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:06:09.521Z"}]	[]	[]
14	4	1	VISA-MRFYTWMN-1FASU4	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:10:28.080824+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:10:28.079Z"}]	[]	[]
6	53	1	VISA-TEST-QEMA-001	مستخدم تجريبي	+9647799111222	test@qema.com	Iraqi	A12345678	2030-01-01	1990-05-15	male	Engineer	Baghdad	\N	\N	received	2026-07-11 03:34:09.212887+00	\N	\N	\N	\N	\N	\N	f	[{"note": "تم استلام الطلب", "status": "received", "timestamp": "2026-07-10T08:00:00.000Z"}, {"note": "جاري مراجعة المستندات", "status": "reviewing", "timestamp": "2026-07-11T09:00:00.000Z"}, {"status": "awaiting_documents", "timestamp": "2026-07-11T03:55:57.890Z"}, {"status": "rejected", "timestamp": "2026-07-11T03:56:03.115Z"}, {"status": "submitted_to_embassy", "timestamp": "2026-07-11T03:59:37.004Z"}, {"status": "received", "timestamp": "2026-07-11T03:59:39.021Z"}]	[]	[]
4	48	1	VISA-MREH91HV-OKO4MG	mohammed	+964779000506645	alraqalkwyt226@gmail.com	عراقي	97594509	2030-12-12	1998-11-12	ذكر	طبيب	بغداد	\N	\N	cancelled	2026-07-10 05:10:34.963904+00	\N	\N	\N	\N	\N	\N	f	[{"status": "processing", "timestamp": "2026-07-11T04:08:47.279Z"}, {"status": "cancelled", "timestamp": "2026-07-11T06:15:45.261Z"}]	[]	[]
11	4	3	VISA-MRFYKOD3-W941MO	عويس	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:03:17.463891+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:03:17.463Z"}]	[]	[]
12	4	3	VISA-MRFYL6N8-PIRED3	عويس	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:03:41.156637+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:03:41.156Z"}]	[]	[]
15	4	1	VISA-MRFYUCXY-JHJ2QX	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:10:49.223145+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:10:49.222Z"}]	[]	[]
1	48	1	VISA-MREH8X8G-257AY4	mohammed	+964779000506645	alraqalkwyt226@gmail.com	عراقي	97594509	2030-12-12	1998-11-12	ذكر	طبيب	بغداد	\N	\N	cancelled	2026-07-10 05:10:29.442385+00	\N	\N	\N	\N	\N	\N	f	[{"status": "cancelled", "timestamp": "2026-07-11T06:15:40.168Z"}]	[]	[]
2	48	1	VISA-MREH907Z-194WT3	mohammed	+964779000506645	alraqalkwyt226@gmail.com	عراقي	97594509	2030-12-12	1998-11-12	ذكر	طبيب	بغداد	\N	\N	cancelled	2026-07-10 05:10:33.311668+00	\N	\N	\N	\N	\N	\N	f	[{"status": "cancelled", "timestamp": "2026-07-11T06:15:41.729Z"}]	[]	[]
16	4	1	VISA-MRFYUO4N-QFPTSR	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:11:03.720132+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:11:03.719Z"}]	[]	[]
3	48	1	VISA-MREH90UT-S1OJMP	mohammed	+964779000506645	alraqalkwyt226@gmail.com	عراقي	97594509	2030-12-12	1998-11-12	ذكر	طبيب	بغداد	\N	\N	cancelled	2026-07-10 05:10:34.134716+00	\N	\N	\N	\N	\N	\N	f	[{"status": "rejected", "timestamp": "2026-07-11T04:09:01.654Z"}, {"status": "cancelled", "timestamp": "2026-07-11T06:15:43.529Z"}]	[]	[]
5	48	1	VISA-MREH93DM-WP4JQN	mohammed	+964779000506645	alraqalkwyt226@gmail.com	عراقي	97594509	2030-12-12	1998-11-12	ذكر	طبيب	بغداد	\N	\N	cancelled	2026-07-10 05:10:37.402854+00	\N	\N	\N	\N	\N	\N	f	[{"status": "awaiting_documents", "timestamp": "2026-07-11T03:56:05.876Z"}, {"status": "reviewing", "timestamp": "2026-07-11T03:56:07.748Z"}, {"status": "submitted_to_embassy", "timestamp": "2026-07-11T03:58:45.322Z"}, {"status": "received", "timestamp": "2026-07-11T03:58:47.289Z"}, {"status": "rejected", "timestamp": "2026-07-11T03:58:49.230Z"}, {"status": "processing", "timestamp": "2026-07-11T04:08:50.937Z"}, {"status": "cancelled", "timestamp": "2026-07-11T06:15:46.782Z"}]	[]	[]
17	4	1	VISA-MRFZQR95-M0SKSZ	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:36:00.761737+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:36:00.760Z"}]	[]	[]
18	4	2	VISA-MRG066OE-SLMM7J	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/storage/objects/uploads/459a49d9-4e34-4a12-8b23-9af273e4b3db	received	2026-07-11 06:48:00.590808+00	\N	\N	2026-05-12	\N	\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T06:48:00.590Z"}]	[]	[]
19	4	2	VISA-MRG10M6H-5CCNPO	ع	07700000000	admin@qema.com	العراق	688766	2030-07-23	1999-07-21				https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/a8985246-a2f0-4feb-99ce-ce94307ed86e	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/bc8b856f-44ed-4e92-b719-a58ebab8b7d4	received	2026-07-11 07:11:40.362993+00	\N		2026-05-12		\N	\N	f	[{"status": "received", "timestamp": "2026-07-11T07:11:40.361Z"}]	[]	[]
20	4	2	VISA-MRH6EG4A-7QZKKY	RIYADH SUKKAR HUSSEIN ALBAKHATERA	07700000000	admin@qema.com	IRAQ	B19330517	2032-10-23	1968-01-01	M			https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/3db499f0-1dff-4fce-8093-dfad84111055	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/96e76565-4108-4f33-b582-92176de69e48	received	2026-07-12 02:30:09.947394+00	\N	IRAQ	2024-10-24	BASRA	\N	\N	f	[{"status": "received", "timestamp": "2026-07-12T02:30:09.946Z"}]	[]	[]
21	4	2	VISA-MRH73EXG-Y5R7IR	RIYADH SUKKAR HUSSEIN ALBAKHATERA	07700000000	admin@qema.com	IRAQ	B19330517	2032-10-23	1968-01-01	M			https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/3db499f0-1dff-4fce-8093-dfad84111055	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/96e76565-4108-4f33-b582-92176de69e48	received	2026-07-12 02:49:34.804656+00	\N	IRAQ	2024-10-24	BASRA	\N	\N	f	[{"status": "received", "timestamp": "2026-07-12T02:49:34.804Z"}]	[]	[]
22	58	2	VISA-MRHAP2VT-XSFULD	ALI ADDAY HADEED ALSHAWI	+971558729925	owus711@gmail.com	IRAQ	B14067601	2032-06-22	1974-03-06	M			https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/fbfb25ed-c4ab-4d5f-be7d-320f70d2aa45	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/84f969b7-28eb-4842-bef8-2603403ee33f	received	2026-07-12 04:30:24.474087+00	\N	IRAQ	2024-06-23	BASRA	\N	\N	f	[{"status": "received", "timestamp": "2026-07-12T04:30:24.473Z"}]	[]	[]
\.


--
-- Data for Name: visa_eligibility_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visa_eligibility_rules (id, visa_id, name, is_default, nationalities, allow_direct, requires_gulf_residence, requires_valid_visa_countries, requires_invitation_letter, sort_order, created_at) FROM stdin;
1	6		t	{}	f	t	{}	f	0	2026-07-11 05:33:32.362938+00
2	1		t	{}	f	t	{}	f	0	2026-07-11 06:42:00.390162+00
3	10		f	{الأردن,السودان,الصومال,العراق,المغرب,الهند,اليمن,إيران,باكستان,تونس,جيبوتي,سوريا,لبنان,مصر}	f	t	{schengen,uk,us}	f	0	2026-07-12 01:00:48.165494+00
\.


--
-- Data for Name: visas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visas (id, country_name, country_flag_url, country_image_url, visa_type, processing_time, stay_duration, price, currency, description, required_documents, entries_allowed, validity, is_featured, created_at, requires_gulf_residence, requires_personal_photo, requires_passport_image, requires_bank_statement, requires_flight_booking, requires_hotel_booking, requires_travel_insurance, requires_additional_docs, allowed_nationalities, blocked_nationalities, requires_gulf_residence_country, requires_valid_visa_countries, requires_invitation_letter, country_code) FROM stdin;
2	Georgia	https://flagcdn.com/ge.svg	https://images.unsplash.com/photo-1565008447742-97f6f38c985c	tourism	2-3 business days	90 days	60.00	USD	Visa-friendly Georgia -- Tbilisi and the Caucasus mountains.	{"Passport copy",Photo}	Multiple entry	180 days	t	2026-07-10 01:28:57.156911+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
3	UAE	https://flagcdn.com/ae.svg	https://images.unsplash.com/photo-1512453979798-5ea266f8880c	business	4-6 business days	60 days	250.00	USD	Business visa for Dubai and Abu Dhabi meetings and conferences.	{"Passport copy",Photo,"Invitation letter"}	Single entry	60 days	f	2026-07-10 01:28:57.156911+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
4	Malaysia	https://flagcdn.com/my.svg	https://images.unsplash.com/photo-1596422846543-75c6fc197f07	tourism	5-7 business days	30 days	90.00	USD	Kuala Lumpur and island getaways made simple.	{"Passport copy",Photo,"Return ticket"}	Single entry	90 days	t	2026-07-10 01:28:57.156911+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
5	تركيا	https://flagcdn.com/w80/tr.png	https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800	tourism	3-5 أيام عمل	30 يوماً	85.00	USD	تأشيرة سياحية لتركيا تمنح حاملها حق الدخول والإقامة لمدة 30 يوماً، وتشمل استكشاف إسطنبول وكبادوكيا والساحل التركي.	{"جواز سفر ساري","صورة شخصية","كشف حساب بنكي","تأمين سفر","حجز فندقي"}	دخول مرة واحدة	90 يوماً	t	2026-07-10 03:32:59.967603+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
7	المملكة المتحدة	https://flagcdn.com/w80/gb.png	https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800	tourism	15-21 يوم عمل	180 يوماً	350.00	USD	تأشيرة بريطانيا السياحية تتيح زيارة لندن وإنجلترا واسكتلندا وويلز خلال فترة إقامة تصل إلى 6 أشهر.	{"جواز سفر ساري","كشف حساب بنكي لـ 6 أشهر","عقد عمل","صورة شخصية","تأمين طبي","إثبات سكن"}	دخول متعدد	6 أشهر	f	2026-07-10 03:32:59.992285+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
8	ماليزيا	https://flagcdn.com/w80/my.png	https://images.unsplash.com/photo-1596422846543-75c6fc197f07?w=800	tourism	3-7 أيام عمل	30 يوماً	60.00	USD	تأشيرة ماليزيا السياحية لاستكشاف كوالالمبور وبينانج ولنكاوي مع طبيعة استوائية خلابة.	{"جواز سفر ساري","صورة شخصية","حجز فندقي"}	دخول مرة واحدة	90 يوماً	t	2026-07-10 03:32:59.995108+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
9	ألمانيا	https://flagcdn.com/w80/de.png	https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=800	tourism	15-20 يوم عمل	90 يوماً	280.00	USD	تأشيرة شنغن الألمانية تفتح أمامك أبواب 26 دولة أوروبية، ابدأ رحلتك من برلين وميونخ.	{"جواز سفر ساري","كشف حساب بنكي","تأمين سفر أوروبي","عقد إيجار أو ملكية","صورة شخصية","تذاكر طيران ذهاباً وإياباً"}	دخول متعدد	180 يوماً	f	2026-07-10 03:32:59.998378+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
11	اليونان	https://flagcdn.com/w80/gr.png	https://images.unsplash.com/photo-1533105079780-92b9be482077?w=800	tourism	10-15 يوم عمل	90 يوماً	260.00	USD	تأشيرة شنغن اليونانية للاستمتاع بجزر الأيجي وأثينا وسانتوريني ومياورتها الزرقاء.	{"جواز سفر ساري","كشف حساب بنكي","تأمين سفر","حجز فندقي","صورة شخصية"}	دخول متعدد	180 يوماً	t	2026-07-10 03:33:00.00373+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
12	إيران	https://flagcdn.com/w80/ir.png	https://images.unsplash.com/photo-1619625900268-c5d01d69f34d?w=800	tourism	5-10 أيام عمل	30 يوماً	40.00	USD	تأشيرة إيران السياحية لاكتشاف طهران وأصفهان وشيراز والمعالم التاريخية والحضارية الغنية.	{"جواز سفر ساري","صورة شخصية","تأمين سفر"}	دخول مرة واحدة	90 يوماً	f	2026-07-10 03:33:00.006463+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
13	الصين	https://flagcdn.com/w80/cn.png	https://images.unsplash.com/photo-1508804185872-d7badad00f7d?w=800	business	7-10 أيام عمل	30 يوماً	200.00	USD	تأشيرة الصين التجارية لإجراء أعمال ولقاءات تجارية في بكين وشنغهاي وغوانغجو.	{"جواز سفر ساري","دعوة شركة صينية","صورة شخصية","عقد عمل","وثائق الشركة"}	دخول مرة واحدة	90 يوماً	f	2026-07-10 03:33:00.00975+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
14	كندا	https://flagcdn.com/w80/ca.png	https://images.unsplash.com/photo-1517935706615-2717063c2225?w=800	study	30-60 يوم	مدة الدراسة	150.00	USD	تأشيرة كندا للدراسة تتيح الدراسة في الجامعات والمعاهد الكندية المعترف بها دولياً.	{"جواز سفر ساري","قبول من مؤسسة تعليمية","كشف حساب بنكي","شهادات دراسية","صورة شخصية"}	دخول متعدد	مدة الدراسة + 90 يوم	f	2026-07-10 03:33:00.012018+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	\N
6	الإمارات العربية المتحدة	https://flagcdn.com/w40/ae.png	https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800	tourism	24-48 ساعة	30 يوماً	120.00	USD	تأشيرة الإمارات السياحية لاستكشاف دبي وأبوظبي والشارقة مع كامل الخدمات السياحية.	{"جواز سفر ساري","صورة شخصية","حجز فندقي","تذكرة طيران"}	دخول مرة واحدة	60 يوماً	t	2026-07-10 03:32:59.989389+00	t	t	t	f	f	f	f	f	{}	{}	\N	{}	f	ae
1	آيسلندا	https://flagcdn.com/w40/is.png	https://images.unsplash.com/photo-1524231757912-21f4fe3a7200	tourism	3-5 business days	30 days	120.00	USD	Explore Istanbul and beyond with a hassle-free tourist visa.	{"Passport copy",Photo,"Bank statement"}	Single entry	90 days	t	2026-07-10 01:28:57.156911+00	f	t	t	f	f	f	f	f	{}	{}	\N	{}	f	is
10	المملكة العربية السعودية	https://flagcdn.com/w40/sa.png	https://c298a9f1-bb8a-4cdc-9f14-8e8c36be9b9f-00-3vqcacsb2ynbf.pike.replit.dev/api/storage/objects/uploads/56b43430-adec-442b-87a8-e22050cbea8e	tourism	7-14 يوم عمل	90 يوماً	170.00	USD	تأشيرة الزيارة للمملكة العربية السعودية لزيارة الأقارب والأصدقاء أو أداء العمرة.	{"جواز سفر ساري","دعوة من المضيف","صورة شخصية"}	متعددة السفرات	90 يوماً	t	2026-07-10 03:33:00.000953+00	t	t	t	f	f	f	f	f	{}	{}	\N	{}	f	sa
\.


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banners_id_seq', 6, true);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branches_id_seq', 1, false);


--
-- Name: flight_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flight_bookings_id_seq', 42, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: package_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_bookings_id_seq', 17, true);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 8, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 62, true);


--
-- Name: visa_application_consents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visa_application_consents_id_seq', 35, true);


--
-- Name: visa_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visa_applications_id_seq', 22, true);


--
-- Name: visa_eligibility_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visa_eligibility_rules_id_seq', 3, true);


--
-- Name: visas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visas_id_seq', 14, true);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: company_settings company_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_settings
    ADD CONSTRAINT company_settings_pkey PRIMARY KEY (id);


--
-- Name: flight_bookings flight_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_bookings
    ADD CONSTRAINT flight_bookings_pkey PRIMARY KEY (id);


--
-- Name: flight_bookings flight_bookings_reference_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_bookings
    ADD CONSTRAINT flight_bookings_reference_number_unique UNIQUE (reference_number);


--
-- Name: hold_settings hold_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hold_settings
    ADD CONSTRAINT hold_settings_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_invoice_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_invoice_number_unique UNIQUE (invoice_number);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: package_bookings package_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_bookings
    ADD CONSTRAINT package_bookings_pkey PRIMARY KEY (id);


--
-- Name: package_bookings package_bookings_reference_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_bookings
    ADD CONSTRAINT package_bookings_reference_number_unique UNIQUE (reference_number);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: payments payments_reference_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_reference_number_unique UNIQUE (reference_number);


--
-- Name: service_settings service_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_settings
    ADD CONSTRAINT service_settings_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_unique UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visa_application_consents visa_application_consents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_application_consents
    ADD CONSTRAINT visa_application_consents_pkey PRIMARY KEY (id);


--
-- Name: visa_applications visa_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_applications
    ADD CONSTRAINT visa_applications_pkey PRIMARY KEY (id);


--
-- Name: visa_applications visa_applications_reference_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_applications
    ADD CONSTRAINT visa_applications_reference_number_unique UNIQUE (reference_number);


--
-- Name: visa_eligibility_rules visa_eligibility_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_eligibility_rules
    ADD CONSTRAINT visa_eligibility_rules_pkey PRIMARY KEY (id);


--
-- Name: visas visas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visas
    ADD CONSTRAINT visas_pkey PRIMARY KEY (id);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- Name: idx_ver_visa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ver_visa_id ON public.visa_eligibility_rules USING btree (visa_id);


--
-- Name: idx_visa_consents_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_visa_consents_user ON public.visa_application_consents USING btree (user_id);


--
-- Name: flight_bookings flight_bookings_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_bookings
    ADD CONSTRAINT flight_bookings_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: invoices invoices_payment_id_payments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_payment_id_payments_id_fk FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- Name: notifications notifications_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: package_bookings package_bookings_package_id_packages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_bookings
    ADD CONSTRAINT package_bookings_package_id_packages_id_fk FOREIGN KEY (package_id) REFERENCES public.packages(id);


--
-- Name: package_bookings package_bookings_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_bookings
    ADD CONSTRAINT package_bookings_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments payments_flight_booking_id_flight_bookings_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_flight_booking_id_flight_bookings_id_fk FOREIGN KEY (flight_booking_id) REFERENCES public.flight_bookings(id);


--
-- Name: payments payments_package_booking_id_package_bookings_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_package_booking_id_package_bookings_id_fk FOREIGN KEY (package_booking_id) REFERENCES public.package_bookings(id);


--
-- Name: payments payments_visa_application_id_visa_applications_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_visa_application_id_visa_applications_id_fk FOREIGN KEY (visa_application_id) REFERENCES public.visa_applications(id);


--
-- Name: visa_application_consents visa_application_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_application_consents
    ADD CONSTRAINT visa_application_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: visa_application_consents visa_application_consents_visa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_application_consents
    ADD CONSTRAINT visa_application_consents_visa_id_fkey FOREIGN KEY (visa_id) REFERENCES public.visas(id) ON DELETE CASCADE;


--
-- Name: visa_applications visa_applications_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_applications
    ADD CONSTRAINT visa_applications_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: visa_applications visa_applications_visa_id_visas_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_applications
    ADD CONSTRAINT visa_applications_visa_id_visas_id_fk FOREIGN KEY (visa_id) REFERENCES public.visas(id);


--
-- Name: visa_eligibility_rules visa_eligibility_rules_visa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visa_eligibility_rules
    ADD CONSTRAINT visa_eligibility_rules_visa_id_fkey FOREIGN KEY (visa_id) REFERENCES public.visas(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict MzFnS3CkicTSegflJNkMHjKCn3HfPTJCC7fgwmuR6poRD4bo2B3vxoc6s5r0FpR

