Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490B91A5B89
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583759; cv=none; b=VVhW4c8wMOGR1SA7dCU+fHrJnRclLi1FYFNEy9gTp1qXMYGGyEIz8Qzj8FYRx9BuJc/6lNVr6fhQBY1sAtC3Ozl2xzbQTgZUNlBprnsPDew98JH53X0aLJ3DHxHpvIMfdzK6+VtEyHnMIt9cG70EOkyMbr6tJJ87cBsJEHsSWNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583759; c=relaxed/simple;
	bh=FDmFvbO80mwMvPs0RwjUUodvCGymVKrln63MPnG1KsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lwhjz2h8n5waRkrfrqIzH42jGLLeGwkgXlUGAkXOKU/Qt2/MSetpvMPvXhzSUJNlOz7tFuNzpYZZjwVK/+aKibNFdEjyVvpoYtONjxiq+9suwjIIHr+nPMwvJ/W/MEbPUaz6ufXqEsUkwNbnvbVd1pTdiBeFqKUBGA9ih4NgZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXx22+4E; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXx22+4E"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so31595606d6.3
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583757; x=1745188557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43CgDCBjHo6ngYeTK6tuHPUS/Q9xbMOQmyIqAS15iLM=;
        b=IXx22+4E3p/8mgv/7xvYQ/K+63Z/x6ewEiEQ3HSW+s7I3EVs1tPQKk9240ZsUYkSDf
         v8+AaMWevwVxWoPT7tXfunRn8ecdJWsBsxILieTWO3L544ICEGGhpWK6PkeeLJ7gfRGQ
         BAzcR/a5hNSNuwxF58EIDUa6MiH8OfmXVZAjth0RieTfIgNPPF1cayR/pt32dRdIQQnt
         V24N3DY5nq2wE4VDAsSjkKkzqcugSbwwjzN48DC+lIGX9jIS8ItuQrKRFylyiJaE1FAH
         GI2a2hDo8njKvijX2DSR2LT6ppZOtkaGUKR5MKjuk6dpdh4bGGpyknRj4LAcw199PAj2
         j6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583757; x=1745188557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43CgDCBjHo6ngYeTK6tuHPUS/Q9xbMOQmyIqAS15iLM=;
        b=Gb8/6H5pVZfxZGKgSwvkEXzvDoUYmUogpLvxlc1wpJfkCEhixCKmd3keVr6pJe/N5M
         uUfJN2vUB5JQhKxt0dcAZieIyBFOoZWXPoJo0alSPbqVEUsnHyRtCuQkvfXq5rJwbRJ9
         Swts/yQtnuDQ8kRRqoljcutKXja0z9k03uiNEI5mKLszycC1T/429YO7146ywSG7L4eC
         XnOPXfc1N5JRb/RHkupYg0RBo8bZcULbRm5fejVe1Zldb6tFb7VumCBZX62Cm0kBS931
         8r2RRxBYbCteKR7MYpxZpNRaas3/N8/HqEKuxp/NfoyIujYMIXpr3NRAhFuwYQCG0pnK
         x3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWAHfEGTQwdBR03vbWRdmJObXa22iPOBHjuEJpMzD48QpuGHCSa4RdWBbV38cLAxYb+cRZ5sNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR8ssQe5lYGRomBkZxtNX274Hj/Ay3uX1BdUmywowluV56ftEo
	BKfwTPXJveqRnhpE1fIAqg3RR6tJvO5bN6MTPDyIIDa2JI6LEboe
X-Gm-Gg: ASbGncsLcai6dEdrmctq763j/9HiDcoEKKu3JHFN1SwQk2P4EMIb8vUAIt1c75PdMvQ
	9HH5O5SuDgqlrXfm3j0XpZE6IQ6X2+yxOuHUXXQFWLjipPl3j/feRTKLceuAWdlvVxxBJJgz8Xd
	kX8a7eHX2BVos+/ppF9AaU7ObR+JFNYQGbsY3OYRP+JGQVR9BmUOAtyZAHB5gciHMneIizkVucQ
	i1iB+0zBkOaQx00CKQo53rX/68CeJuVcmdw6z2Cf9x8aK9a6PPFYNJ6tRIY//9zbbXFwKTrKzMg
	l+Q4nC49K1P++zlK
X-Google-Smtp-Source: AGHT+IHgIwU8EKIYK2PDbSSxKKuKXD1TI7k5AoqJe5OL7pKcbt7fRbaJ6CDShheZnqef2sBXIGHehw==
X-Received: by 2002:a05:6214:1ccb:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f230dc388bmr178446836d6.27.1744583756982;
        Sun, 13 Apr 2025 15:35:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea07f3esm70937336d6.76.2025.04.13.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:56 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Date: Mon, 14 Apr 2025 06:34:56 +0800
Message-ID: <20250413223507.46480-3-inochiama@gmail.com>
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

Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 2e92bcdeb423..4ed30efe4052 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mtimer
+          - sophgo,sg2044-aclint-mtimer
       - const: thead,c900-aclint-mtimer
 
   reg:
-- 
2.49.0

