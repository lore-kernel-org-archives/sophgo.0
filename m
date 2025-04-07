Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F819D8A2
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988031; cv=none; b=L/GqjYjJsYMkKecZ+r2pcSuWBFErzeozEDD4zXNceNsvL48r+rMtWU4SyapZEGOLLNwKbZdHmU0KIKQ9PSl2hXtO8p5l+8yIqA74AmhdaKfYkCixCAVHmZ5xiliFxmra2jryXuaTtY6kUAO/BANGeeQipM8w+8wnX1I3BELGfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988031; c=relaxed/simple;
	bh=jYTLY64D0l34lxLFo3j+PHTtaLiCbOVjmwJfDziXE8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWQSGC4NvStU0Zv5YEocL764aHm6WNh59M4JvLW6sngwe2hh1kL6VlSQYgkmFP3l5vfu7sjVxsED0/Td206xjvKtA3SGs/0Ij4LFhQcz+Lvq7lufwy0oSGVypLqETpCyGKYpMsrZOzW02wUR2hkRPC1uM6OX9qGD3MjhPlqU4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCdI2Gl5; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCdI2Gl5"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476a720e806so36681581cf.0
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988028; x=1744592828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2Z/LMww8mdvu9Fif8Aazjm67LPyxM6t9FzcA9LKH0=;
        b=TCdI2Gl5GjEH7d/LOJyJoFi5BPX8xrZHIlB72Uf6EeYccWpz8apltk6MJUmCsyQkwK
         9dauvtmsO9pzp0iKvR9nJjb6+dN8aDXI7BO8HoCVUJXcUhaCLwI/y6/M2OFVj4dUouyc
         6MW9HBxHuuJ5OZwNoUf6ejN4K+EXYmaaWNGmvTzBEXOYwGqx/FAkxUtXmVxfgKuAg42t
         cw6ct15MDPQTu2hULJUkDIMjUkuDwekosy+uybhAGeHTYkfQRyEnvLQPYAo0hi9uxelS
         kmYkVGqj889Z6KnJGidvyTkbzhBhw6GB+7TVmIz0t+5ewR1DicXR69yVRjNteOEFO8Lt
         U1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988028; x=1744592828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF2Z/LMww8mdvu9Fif8Aazjm67LPyxM6t9FzcA9LKH0=;
        b=swQ7amp2/nEzsCfcUIgZyGUpm55CZjZ9Ci1DzC+nQqv8ZaB0vTi9/jptmpdbLiP+n4
         DAHW3/3mktTOPWVbRDAqQUbTH6aSdp/1z8JyCtbfDojgAfz87HuBWvR5Rc2nJOpulgPZ
         fecldjA/szE0UbScFk1yC0z8WkqUX1TCL2WtsptJsTSgcDqV3c151A84XlFi3yuPQ/mv
         B7QphuU+9EY/xp/65aBCdgFlEC0hG6ESm+3MOBD9qHWOJLf51NWgKnsZwKKjBqbo1iW4
         p+wrkLLN8tTgSxrLccUSYSS3wMeajEJLlTY6mTOVxblFFNgEn38wUQHEegjFdoKedqws
         x5iA==
X-Forwarded-Encrypted: i=1; AJvYcCUAUsvMvgiQdlcH0tzCqsY8A5m06NHyQ65SiPZQc+juxbfh5hexTgOTs0FYv9wi7R+w5U0HWMo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Hlb05r2jztAtxQT2QQJiOK0xywFYFODjgoHFvlvfc/Xu5Vgu
	PRbmBWUxmTJbzeJpg1a6lu39bZeRSWWc9ciwjQ7kt/h7cNYRBtP8
X-Gm-Gg: ASbGnctJC2S1ZjgxauAO+ciUWihjzCbdu15sXStm+vabhfeqeOJNuT2vBK+yLZdESL9
	cnUD6tg4H6KSw0uy045DWnf58LZceX4wIYWjSfsulskkTnUgkxxdEi0A05ZuqmJ92mug4bLM1g2
	QY1USTUWxRI4TprpQj7kchfeCYWnIHi8JCUNvVpYyJO+eHiLG628beckH9lUIGkuX49aPCZtjQa
	FyP3tVePX8ACNKg/USyA44fu+myYUAxEMoI1cmzzLxGd7AtnlLaZRhPDe/o9t2fO7xdt2tw0V+I
	k6PHBY+k1KGEx39rxWha
X-Google-Smtp-Source: AGHT+IEjRuU35AfPurfPXYbUmQsHwNGIrdGvMyKJUg9772NQKPw8J7O6eXPVhRjVY/XGKChEAioTSw==
X-Received: by 2002:ac8:588f:0:b0:476:c82a:9fe7 with SMTP id d75a77b69052e-47924911dc4mr120825721cf.10.1743988028468;
        Sun, 06 Apr 2025 18:07:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e73558bsm530443385a.17.2025.04.06.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:07 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 4/9] dt-bindings: reset: sophgo: Add SG2044 bindings.
Date: Mon,  7 Apr 2025 09:06:09 +0800
Message-ID: <20250407010616.749833-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2044 shares the same reset controller as SG2042, so it
is just enough to use the compatible string of SG2042 as a
basis.

Add compatible string for the reset controller of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..1d1b84575960 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-reset
+          - const: sophgo,sg2042-reset
+      - const: sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0

