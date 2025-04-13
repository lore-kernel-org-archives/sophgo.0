Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A961F4C8E
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583776; cv=none; b=hdfetEXNznoUPSSgwU2YNXrBlu5K4tzPNrFdCqNBvKg0sDbPDAtvJ1azpGlKWapj3kDIq5uvFKlJ/BQxGE9AMgNJGlxonAuf/iqxNd0wQte++Y5v9GgrUbWvvhic6IYs4vI/m+iZ1e+w0RkuH+qs7g1nLbCYREpbyp3mSD8geGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583776; c=relaxed/simple;
	bh=RFFraQV++/mEmJeBPIAey/Nmbb6tNuLRy7ftXsabnfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qcef+8918+sBp//sbJDyCiYVmeCSaEGKyyu5CYDu+GdmTvpuOuiBXUWInVNn60zAyOj686usGumh1t5i6DFJdGBtF9jmSvwUIwGxKRKYxU+XzeyPS29mZB8BKnenwtQovlI92azft2W2lBetC2ln+GpdfeeQ9RABn4/KtSpo30U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+sze3xm; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+sze3xm"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so44579186d6.0
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583774; x=1745188574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQtb0pSGVQGTtXkIrJkeCkQBuvZKt/sx/lVi2mJE3r4=;
        b=M+sze3xmep/bnD3ztdo43p+HTaeTlhxYR6y0Lv+W9V1sBUuou0Wn/lHqpAC1xm1Dcj
         wQIqml7zNoi+ro70mK/phyERBc0nojiH1y1LOPhoUdFqHCkKY7xdGHHQtMD70OEiPZVF
         hXsOLfE3dW6Pjb5/+lIyMhuawyEnyC+Yw9Uz/QfD6J/bYWpGk1K8ipHL19EJfJkdLhTp
         mpTfLdjJ7Bzl5XFb18Y7AtHAV4qFBdvcPhupC3zR7DoukZsecBoHUiVDG2W6D71vPj9l
         jnNvfWicVi8mqPbBj/4JQEuLIVFRN7+AY9Vt8bsXD8OKuqSr0a3Tzhz5Xr4I+rPnlqgU
         3YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583774; x=1745188574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQtb0pSGVQGTtXkIrJkeCkQBuvZKt/sx/lVi2mJE3r4=;
        b=QSlgrl7UJ51Yvo0JJxR9Xlz089ZflE4McBOZefxWvxoaqrqpEYiaOzVtaBjC9gvNxx
         Zg3Kmms9KpUClwRukLF3faboSxJbGwpz7GaK3H9askqkb9zKGM8RN8ziequCrQzHORsD
         LeEOGVvoge9GTJBaidQZjIxL8And7TY3d5UU0k4790QYa7ReAlCvPDqfn6rrHbHYAumP
         cFO8R5ilLsniyp2aWgVHHllILRCl5JSIGXrvYdp4JcsEo1P11izsIoxrVMT6TsrJni57
         Jw6hxKCKJklfiuAnEJJVGobOhkOGqa6f45ZjoVt6Khb49x77D4A0clZ8LqAID9rsabaK
         WpEA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFpyZe/xvgmuGmxOc/+1POcskd6W7LcXavubZ+ZsOljNg2cxD76Xb1PPvAjINjQ4MmhYm4GM=@lists.linux.dev
X-Gm-Message-State: AOJu0YztVxmNPE2g3TYxoJ+jt7xzlJXeaaISZO3FcXNjos82//ENDT4w
	PVfzDaOFUkNp155iUXjB8YwhfnpR84kAv4+neQ8FCL2dqJFUFu4C
X-Gm-Gg: ASbGnctIgAGd0Fmww8z9ydxX8/B0q5sDEXlBIfa0/slNaZHjFGZjvyB+6WSNAEBtovT
	WUURI9pT9DAK25A/q6hBlqKzZvWUPXVJLvJ7JiluHSJpMTyq+dg1vH4HXqTzkg7kJ/XrxKRNiNH
	0WfcdHDB/+sigJu2mSaR7uZBCGauOrNyxUe2GOLZaVBL7ZO/Y1/UHIcnXuWBHx1WQ2POdjMhgN2
	4BJosLFaEMIFsHiUTDKdp5uU/UZAyw+oQY6lsd41Y9qdu9IAgQAE2gzGs+oFS/5p5jYDDLb6EHo
	qyKzEN8+ZvhBcpG7
X-Google-Smtp-Source: AGHT+IHcbYzXgxBWScH80KwGFOQiw4xCi7hWgB9/z1qenwglZbRcB30OmSj5yMnaB0Bpc9VZ1St78g==
X-Received: by 2002:a05:6214:e85:b0:6e8:fbd9:169a with SMTP id 6a1803df08f44-6f230d000cdmr144479206d6.11.1744583773712;
        Sun, 13 Apr 2025 15:36:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95f7bdsm71938186d6.23.2025.04.13.15.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:13 -0700 (PDT)
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
Subject: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
Date: Mon, 14 Apr 2025 06:35:01 +0800
Message-ID: <20250413223507.46480-8-inochiama@gmail.com>
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

The sdhci IP of SG2044 is similar to it of SG2042. They
share the same clock and controller configuration.

Add compatible string for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index e6e604072d3c..5fb347167004 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,9 @@ properties:
               - rockchip,rk3562-dwcmshc
               - rockchip,rk3576-dwcmshc
           - const: rockchip,rk3588-dwcmshc
+      - items:
+          - const: sophgo,sg2044-dwcmshc
+          - const: sophgo,sg2042-dwcmshc
       - enum:
           - rockchip,rk3568-dwcmshc
           - rockchip,rk3588-dwcmshc
-- 
2.49.0

