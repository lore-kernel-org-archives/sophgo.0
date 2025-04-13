Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8911F4194
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583769; cv=none; b=UXfkWz5p5ccx/BO7PfFY2ECcm64rj6q6dXTPvb8sBqbnXwq7lTcnJ5MyE89Fbw2UnMlw619geUOzu5IBqTJesKzMcZKHTa/tcyF3dpFO2yswndyw6uvvdoxDV9PgtgLnlK5OZDz3v30v/kLBD4PRcbr5zeK/0rMj6s69umCf03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583769; c=relaxed/simple;
	bh=TMuFZE3uwWqlbhcZRFkFsW1I9li+cAvVgT1w+J65Ev8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlkhzKgZzWF2Kt4ojea3zcKwCjS8EqgbCZRaTPi0Q3LcTAt6rYyQokyov2q80ZPyYJPxgyovsrMHl2TjSzucvlk2m71wMB4VdC1MrcBSislQo9UIf20S7WEnkH7EQWuHVIRp3LLvxVxp+LpphpPTzFJ0ms3t04yg4OHEoZERmHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmzDi63R; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmzDi63R"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476964b2c1dso65712141cf.3
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583767; x=1745188567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd5Yp7mYzKhdmL1h2lCqbEU8oe0XDXYRUx64ZvpbCPQ=;
        b=fmzDi63RS6LXs4Ge0Mkpy6DUu3ljDai7+eLLlCvYSM5a+FcDmfR8+rRTtmq5SmYDp+
         h8j67MHQgSveAcHOB+hFs4SufESrRe0hgMHbKpfZmTT0AXeGb52VnMgLXjXEa5gTlzGF
         1LpJ7Vk4SVjJEDrzD7HuQiXv4PYBXx17MpCz1vODlnENdhyhSz0aoE6pGAUxJ6IiXYv4
         IwE3HIYf+YmJlD+MhpbZwpdIxxqrzlMy0tu9Qcu3QzijiAGPxYytjGkXBnE0G8b94UN5
         8HrJKz+EvOXHlwgDykKRwbqy1x8c3MEtl33nNMsOgH5oC85PCOTbIe0yTEWW7EiiD+GL
         ucCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583767; x=1745188567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd5Yp7mYzKhdmL1h2lCqbEU8oe0XDXYRUx64ZvpbCPQ=;
        b=KLXGlPjumq6nS3udQOur+Em2yJvyvrpvUWkKCSCg1cngr2I4ov9dPXZ0nvA2mFbF/r
         g9hXpLokJ4vuVXJ7LczOwPly2ufiAYWtQum6hX1rDnGBmX/vfUVu4xNyi2enDc62xSKj
         Dm+XNQqx9EYg68gSpvrdRk+nK1EgGiVGuT2/45qBAGmLOa+kwh0zz7GZrfI5/ESo94EM
         7tfG2PFD+7POGLZ/MCzlxQ1YuIAQV+IBdvUAODTCRkFV3quc5h7NpLr5HmgunfI6qbbo
         ZfoNP/aNjWSMCiuSd4Vp1UnqSZK4LjeEZuMSM6TOdINArc/S7+75XwpjUVxZ8AjP/62L
         k7iw==
X-Forwarded-Encrypted: i=1; AJvYcCVRAFIR63U4FLkHDzfpRZTvTlDasnQ4iVZRVlbPgPk/TWVO/q8c4S8ZL8hr4ClPnNLSSL6XIbI=@lists.linux.dev
X-Gm-Message-State: AOJu0YybKDiLNEADTrubRtOiaaEyY2VrfvUs9ZZV8j00xguvcI2t9Hys
	ECEWqeaK1Tzhr6BqvYjQtZm7VOqXSSb9TzLKXtYCXGfLXe6Lec9H
X-Gm-Gg: ASbGnct2Y0b6JA6DjhyAB9jL+v1B2hAs9AokIArO/lN9pmyvJknzkyinke3pGCjQJNp
	OUzAznGFJNwYWFBDHke3itSSVVxP4CePeF2jp3qWLohqWfYEBhbS8zOjTPJ5HOUTj0lOkein07x
	kny0qZzpYdC0WTLUqj8Q3Gfy8/Oa7ZcNwVKq7NutPbwXhU/asND8dGOF9gqhUMruF3ZiE7Cxyk1
	WDMsJZvaSzdV0WkqLJIkgtSA9xhaO+1cVjJJ5uBzte+cy7KZQruIYbpQl4hQJCl0eXVvnRmVxh9
	MMfUm/h5X++hYBUkJBc3ChXc4pE=
X-Google-Smtp-Source: AGHT+IHxIX17/RksehIAE9qWmRUC2wRTWJEDXIPk2oaDG1loYguyGUkNQnE+W3CfecxHYIg+ukOYeA==
X-Received: by 2002:ac8:5f09:0:b0:476:8f90:b5b5 with SMTP id d75a77b69052e-4797755ded3mr175591431cf.27.1744583767292;
        Sun, 13 Apr 2025 15:36:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb16693sm62351371cf.25.2025.04.13.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:06 -0700 (PDT)
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
Subject: [PATCH v2 05/10] dt-bindings: reset: sophgo: Add SG2044 bindings.
Date: Mon, 14 Apr 2025 06:34:59 +0800
Message-ID: <20250413223507.46480-6-inochiama@gmail.com>
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

The SG2044 shares the same reset controller as SG2042, so it
is just enough to use the compatible string of SG2042 as a
basis.

Add compatible string for the reset controller of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
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

