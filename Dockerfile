FROM --platform=linux/arm64 mcr.microsoft.com/openjdk/jdk:11-ubuntu
RUN apt-get update && apt-get install --assume-yes libjpeg-dev zlib1g-dev gfortran libopenblas-dev liblapack-dev libatlas-base-dev libblas-dev  -y \
    && apt-get --assume-yes install python3.9 git python3-distutils curl -y  \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm -rf get-pip.py \
    && pip3 install numpy keras Cython python_dateutil pytz Pillow requests pandas datetime matplotlib pybind11 pycryptodome scipy scikit-learn \
    && pip3 install torch torchvision statsmodels pmdarima chinese_calendar sopt openai \
    && pip3 install openpyxl PyPDF2 Document Workbook pdfplumber Python-docx \
    && apt-get clean && rm -rf /root/.cache && rm -rf /var/cache/*
