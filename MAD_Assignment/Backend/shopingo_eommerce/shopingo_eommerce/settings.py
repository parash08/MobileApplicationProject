

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-+z10fz+*a+q2m()7b=i2=d!8!47+l_tbhm3y@v7(6@-28x(uyu'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["*"]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django_filters',
    'rest_framework',
    'aboutus',
    'refundPolicy',
    'enquiry',
    'termsConditions',
    'rest_framework.authtoken',
    "corsheaders",
    "shop",
    "account",
    'django.contrib.staticfiles',  # required for serving swagger ui's css/js files
    'drf_yasg',








]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    "corsheaders.middleware.CorsMiddleware",
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'shopingo_eommerce.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'shopingo_eommerce.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
# settings.py

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'defaultdb',
#         'USER': 'avnadmin',
#         'PASSWORD': 'AVNS_ExwurE12m5VqPe1jCeX',  # Replace with the actual password
#         'HOST': 'shopingoecommerce-shopingo-ecommerce.a.aivencloud.com',
#         'PORT': '15019',
#         # 'OPTIONS': {
#         #     'ssl': {
#         #         'ca': '/path/to/ca.pem',  # Replace with the actual path to ca.pem
#         #         # Replace with the actual path to client-cert.pem
#         #         'cert': '/path/to/client-cert.pem',
#         #         # Replace with the actual path to client-key.pem
#         #         'key': '/path/to/client-key.pem',
#         #     },
#         # },
#     }
# }


# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = 'static/'
# STATICFILES_DIRS=[BASE_DIR,'static']
STATICFILES_DIRS = os.path.join(BASE_DIR, 'static'),
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles_build', 'static')

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
AUTH_USER_MODEL = 'account.User'
# AUTHENTICATION_BACKENDS = [
#     'customuser.authentication.EmailBackend', 'django.contrib.auth.backends.ModelBackend']


CORS_ALLOWED_ORIGINS = [

    "http://localhost:8080",
    "http://127.0.0.1:8080",
    "http://localhost:5554",
    "http://localhost:60675",
    "http://192.168.1.64:8000",




]
CORS_ALLOW_CREDENTIALS = True
# REST_FRAMEWORK = {
#     'TEST_REQUEST_DEFAULT_FORMAT': 'json',
#     'DEFAULT_RENDERER_CLASSES': (
#         'rest_framework.renderers.JSONRenderer',
#     ),
# }
