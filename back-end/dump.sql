PGDMP     ;        
             {         
   webcars-db #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1) #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    28206 
   webcars-db    DATABASE     a   CREATE DATABASE "webcars-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'pt_BR.UTF-8';
    DROP DATABASE "webcars-db";
                postgres    false            �            1259    28264    ads    TABLE     �   CREATE TABLE public.ads (
    id integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    mark text NOT NULL,
    year text NOT NULL,
    description character varying(200) NOT NULL,
    userid integer NOT NULL,
    picture text
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �            1259    28263 
   ads_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.ads_id_seq;
       public          postgres    false    212            �           0    0 
   ads_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;
          public          postgres    false    211            �            1259    28273    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    userid integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    28272    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          postgres    false    214            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          postgres    false    213            �            1259    28253    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    number text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    28252    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209                       2604    28267    ads id    DEFAULT     `   ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);
 5   ALTER TABLE public.ads ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212                       2604    28276    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214                       2604    28256    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �          0    28264    ads 
   TABLE DATA           X   COPY public.ads (id, name, price, mark, year, description, userid, picture) FROM stdin;
    public          postgres    false    212   /       �          0    28273    sessions 
   TABLE DATA           =   COPY public.sessions (id, token, active, userid) FROM stdin;
    public          postgres    false    214   L       �          0    28253    users 
   TABLE DATA           B   COPY public.users (id, name, email, number, password) FROM stdin;
    public          postgres    false    210   i       �           0    0 
   ads_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.ads_id_seq', 10, true);
          public          postgres    false    211            �           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 69, true);
          public          postgres    false    213            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    209                       2606    28271 
   ads ads_pk 
   CONSTRAINT     H   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pk PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pk;
       public            postgres    false    212                       2606    28281    sessions sessions_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pk;
       public            postgres    false    214                       2606    28262    users users_number_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_number_key UNIQUE (number);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_number_key;
       public            postgres    false    210                       2606    28260    users users_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pk;
       public            postgres    false    210                       2606    28282    ads ads_fk0    FK CONSTRAINT     i   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_fk0 FOREIGN KEY (userid) REFERENCES public.users(id);
 5   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_fk0;
       public          postgres    false    210    212    3348                       2606    28287    sessions sessions_fk0    FK CONSTRAINT     s   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY (userid) REFERENCES public.users(id);
 ?   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_fk0;
       public          postgres    false    210    214    3348            �      x������ � �      �      x������ � �      �      x������ � �     