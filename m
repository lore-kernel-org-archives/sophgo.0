Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8801F5437
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583780; cv=none; b=ZfuWuNYdahMiD/S0rohCXDuSSMQd5zMPs3wEuUCAuDXfhAAr0x4POpxAH0wSH14K09QivRTN0UjZtu+mwu88tY4ISHa9yjXXR3Xy9BaQmCr0ksR9p46JOK5dN+RXFVj5ZMR6X+7D2dEXdAW57xR3eECWURCRHoJNUYJ2sPNcyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583780; c=relaxed/simple;
	bh=RtgXCHZc+h1RKl4LYdPxb9zDI5WSUHiQRGjVvqplY8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAObmWh36UjC/UanmI3SeoYQzbUDMUcq/d7CnQmv7p9bM7cjtTXKSasY6m0dsahd3iEb5ohchEpHi4PN9wY2mvhTSOhbS+QnEjuPaKIlPQi8BccGED1PQJgqj04mjSwB098m9Oz6/XPhR/iqJUVfRsl4ZS9tNjsAeCzR3mq6iaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaOpo3Am; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaOpo3Am"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c7913bab2cso373062585a.0
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583777; x=1745188577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daviB1cPKUPKVTzlHwAPUCR9r/kY67ATms+WR51ErJw=;
        b=GaOpo3AmkLJtFg00hPaPGfjc1Qdiy/nFW7igDyQv8gK/COFhGihFnXZ99Kt+5Wr3i7
         IvwHkwtRt7+51ApK+470stdq1Ngz5jd8J72gkAPJZPIOu3oq4wjj+DkJy3CYN+cub1uS
         dtSDZXf2Y6z4CaRncsA5FB4KPx/lonqGds5ujaFgk/b1L2/+mDlKEa1maIft9hqrzzr0
         /NaEcCByUMNGZ1DxyXstx9dcdcwDbksHQKVsueNgz1S/tGhZfQOViLnuXrbg946VOBQe
         tX+UJN64OhHOK4Xib2iZdrgJXCkvNUFk/wHJEFhAzZAzVtEHaOxpPXdywv10XTAfecMA
         egdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583777; x=1745188577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daviB1cPKUPKVTzlHwAPUCR9r/kY67ATms+WR51ErJw=;
        b=A4Edz8I0Evvnqm874CK8JgsWoScK2xFQlu+29wdzqa4suqVz6r/hSf3vaGvIBSKiAT
         W5q9VP7bS3kF3bWw4PUpMnReW1ilTG8tGKFOeuhgptnfF4spNldG48IMZBqOvdzpCRoe
         KRv3Y/dOiFYmYQm9IT4tMXxp/VQXXQLvZfjRKNRQw8wWqDxo5zntSbTR1tMdemu6+zFO
         Yh1yixGhbj+tPTw4lpPSubq8PHgKfmjc3fLD+3qKrDIxN/i/lG6dIe2w323WvAyL1865
         j8+dfA2QXefKY1OnW4c7yJdFc/4nGWSjZqpvCis7IEX7xI32TUH2ZPQQOJiEBJSCyyld
         evsg==
X-Forwarded-Encrypted: i=1; AJvYcCVqVRWPNfjbwNmDxoYaz9HklnOa/dRiELLtb6xvre4kVBNhOKxgvv/73OeKJJZvmNr736PuCyk=@lists.linux.dev
X-Gm-Message-State: AOJu0YypWpq5ZcceHhmKb+aihlQR26R547oA1ps/mhUGaBPX61uDmf2z
	Ycu2keP5Qzw/N8ecQ4wdjuuee2B0gDfFenHSELl50zLwIpM9TxhN
X-Gm-Gg: ASbGnct+x0DFiXDtoccBsP2/ym4iobioNTlyS/0BEEmEK/CPLkeVGStU3afMotBEaQa
	oKw7mWsNckq8sSgjqFrEWsgE22P4B/VvLzjqwOPa4yZQNdGXHBC4N1HvQNkMBnV5/FZ7B2DjglJ
	sO0RBs755W3EKH+9d1Ubqdme9+Mani3MSTtFoKT5xLcXBRJcMJ6qT52m93o7iHqpjugEoMgJZ0t
	m/KZJ2N+62it9Q+Wr6QIFu2JVFaY6M9H1FAKsizHZHLZjoA/+NX9kJX/YS8uPebzs5pOepSLQ7S
	5mI/ZKfZEGbholNt
X-Google-Smtp-Source: AGHT+IH7HeWo8kUCZYyXEzOfMHfoiorUFdL+FJ/xQY39VdlD+gIfOhemdYptpXdGIj9JLJ3nuLc1RA==
X-Received: by 2002:a05:620a:4045:b0:7c5:49c9:e4ae with SMTP id af79cd13be357-7c7af1528bemr1539566485a.32.1744583777535;
        Sun, 13 Apr 2025 15:36:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7b82dcaaesm290676885a.89.2025.04.13.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 08/10] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
Date: Mon, 14 Apr 2025 06:35:02 +0800
Message-ID: <20250413223507.46480-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for Sophgo SG2044 SoC I2C controller which can be
used specifically for the SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 98567dc791c3..d904191bb0c6 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mscc,ocelot-i2c
+              - sophgo,sg2044-i2c
               - thead,th1520-i2c
           - const: snps,designware-i2c
 
-- 
2.49.0

