Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0BB3A6408
	for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719475; cv=none; b=C06oZSqm71JjKvVlE3GdpI6bS629s5TqYmBqBR7pwSPQVlYUNt2kCOYd+HDONCvUzn4Qj9V44L16/SObrxC3swhj2lYo2J+xPyZ5nk8OSZOaIknun4iQS0LnD9BWlTPTfR55ACvfmY70ASa68qBbqDHFZ0C5iYopq9xm+E3cqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719475; c=relaxed/simple;
	bh=cmszwX0Ji3XjQt7Fpy6t/qmhlzCiNP9RsFnOxecQxzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDsO0F5L1I+uOUD9d3QjwuZzCBOUmDe266ynPPvxPEv1yYP4RqQZOV0bUbHa4RL02ZrXaOljRJylYsjiS95ikch7ThJUdI1DBqqgNIypfoj4KNfuUDOgTZpBm03ikPLdzxRjDUHe2ppWN3JyGncl26IzxgilqCXJ6KauCbxKLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWSSCv6k; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWSSCv6k"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506aa685d62so17293131cf.0
        for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719472; x=1775324272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=SWSSCv6kjqKWD1mqT5P1bV2qdBvzPm8ZGJwICja30CHY9kFAHcuorUiKvbMgi1fCLF
         UVJs4CsYaemTY7vRPRBaxWGCyRXW0Ax5X7MkLDnQxTLTMfZr5AgX/q0t+gFigEn+8MJD
         bTGjpitHN7guHXZqTfpnoJ0gf+8V4+7d6WJv6u1zHkE+tPLnm5BVuKuDC6NuZdOCu15e
         yOOnl/lhEiBKJPyZnZe+mJPJR37GCTEZ/y4BhMgna+1LrXb3mUq3CLTguKoPPeaGhib+
         exYjsW11FnUch/ljKbNK5wxlE53+vo0TnXK8mLRZxlXJPheFHmxjPFxuCDZpQljU4Usi
         k0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719472; x=1775324272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=fizcWa4h3rMoJ+gZCfj/zv2u2Brr6UXb2bpp4iEl2rtAB9a3hzTqXJQJk7IsS25brS
         T4EUN7hCP7xeu3a+GJ2wDOzp3Twkq/vsbePh5eOHiMU0yAo1kytZfDF5ioGYznKuhpxG
         O24c8U4omjnsFl7ovLOfqmgX8Qf18wuKzc111VUgsv095nBZDFEfG1eCO/i3WeK7a5Jn
         g+1Ak2FueMj3NpBjwz2yqbBoez5XWu8iyYAtWhqSPMfTX9zSNNVekYnqQk3Y945D/iXh
         d9dGSGe3I/mu/R+pfgssNoR/v5MUyiEXynLw90dM5GbVWWH9Ih6ZWzRuIHi41OUkEMGW
         Wl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXMvfe7shCAT1Cch87+NUIFja2hZViuaR5k4UmoPahnjbQclFYkZHAoEIW3VzL2JMIURlJfWRs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4EpnxWWGYkqUkUeUjA+votWBOePA/PeyQhFoOomAvbc0f3eFk
	v27l3S9svj0nQB/MuyLYUIJCgt7JVNrjRrdwzbbmkA7CeFOf1053Efb4
X-Gm-Gg: ATEYQzxs5QHs5YrwIJmPrROGijLbWydPQFIUndb+Wl0hEnuynx19ockL8zpUG849hxI
	j1EFVuZGCSymu/VrrX43y8u68Uhc7nx4KNs6rr5bJqImFDbVPm1MbJIRYIT0m0SKndnIxLwWT6G
	1j5m0Twl9OY+8D/F0eo8Pd9aYnAbldWmXEfKStkMAM69o8q/yg+Z9DcZrV5KmfZbr8d85DzHQVh
	QHZSyMkqC2WbTKzuiA1aRGKGtBr+zPUi1xVU/IqvmxnxMkdSVPKJf6EdDisFsjJavPRY111cTem
	Cwm98vaTrWVCnxUF8E70OTFkGKQLV256uiCcjwIEKKoejF9Ri3mM9F8va4F9rTzbM0O/HL1+VeI
	qZcOtUaztmTwy7pUrmWc27D+0bDdBTb22xRAoi2cyFXKQhAAQ5ABKMDgWOs2stx9PrV1kU1Buot
	+js5MicBfkvJ4rCdZA3SFpOD7BDJ0dsRkFTL/XacDLJ03t1rkbLoJQQEl+
X-Received: by 2002:a05:622a:514:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50ba369ec17mr96131411cf.0.1774719471720;
        Sat, 28 Mar 2026 10:37:51 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:51 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v4 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Sat, 28 Mar 2026 13:34:48 -0400
Message-ID: <20260328173450.219664-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0

