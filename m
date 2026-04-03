Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC2372EEF
	for <sophgo@lists.linux.dev>; Fri,  3 Apr 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214963; cv=none; b=HWij7ehBDDhFVmYIm9IQcS1pVzEQlyUQAeX/XylCkygbbv4e0ioRk2SgnZX9+0sJviUBtDZ859TQ/kE8e2aINoB6OwMxEXmlnkCj2zrSMYIaEl5KqcOdUasu4VqnAPAzme4cJbPStaaP/MVKRW/QqLnOOZjYQV9cztND5bp1fOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214963; c=relaxed/simple;
	bh=/iKoxf3LOftVvnFst+ry8upkECO2m/4sz8OzKStj6vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRHPGD6NcpB35wCDXHmD9CloTzDftsNkp+Rr7Xp84ERQ7jHTgE1//m6X/pVWJjRSzUZXgcozusq3mnSyS/2MXf1do0Ecx5WPpYuURH26VcOFgXU1hYhEyhrqahRbZo9mrOAhSAcXXVqLoHQR182WOpFY88IgU6OdBFSysTp3uls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLqjkLS5; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLqjkLS5"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89cda8de641so21975766d6.0
        for <sophgo@lists.linux.dev>; Fri, 03 Apr 2026 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214960; x=1775819760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=DLqjkLS5f31YPaw0KinuOcHyR3Od/xQimXenAQnoSOMwZRnOC9oZ4lVxLEWD2Alfde
         D4+rJYMV+ItkBfYGCzMCYvJMaJuHdWtMn/nGDxLT0F57UFoVP4k7nNEAQ8HWYOxvNRIX
         aHbhI+sHjoDq6Cn2uis14dmCpRCeIbBD3LGbDTkTUAWkmVMeksk+O/iJVs5CXi7MdtnS
         gwyWcxkJp+fqpiRh6JhILQLtUb0Zz5VVvqdnT2na4bZZvHEEruube8N+VWWU/0vfXOmh
         MpjGFgAJGQIEq+yw6ZCiP9j6E54qpOcMyBeXV/jTPByhTS6Ie9cvFV3JBoEOvdBIm03s
         VIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214960; x=1775819760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=DigoX63ZG/IfeWth4c9e8lJlAOHOU33dOJSXWdzrhHknE7jN0THTUuB0tf/vCxwNmA
         7/UFbocWktg9ii2gvNZPoFBbQ8M913EaaA0EbaUrgPkOUdQgVwkVf00353oSth04tdPO
         UcTDVvCHBGFKTInPJpiapaNZ4Bni2r9eoodXW/omvRaNBjpYYYsn0XUDfwBK5ws9LUM/
         95lT7s2LyIQAL4g2Zs6uAEYpnRPio2kvv/A5LgKGdtsNS5og2wUlnlVa2zHCEJLSRIGl
         MId0PlK2a6lgvJiQ5wDdD99ZXZ3xlWwyLjGgYDIyd9HNQ26ppUgjcIH/QcB5ZFxzFtSc
         Hk+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTpH62p0A7Oz+Cl/Jc9Ez0JnIG+suaCtUtliV8PSlU/plpYUMjK2Pyg1MxxCi7EF7s2ujP90I=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo54PY9jPCHhPWdoTXF86/MbGnVJcdDJE4IbdE2Is2LYeO/01R
	jnrfWrd/B1ZyHwtrrt1ujRrQpxBWvrTCXWo6HWj93uS6QWwil/fh4e1l
X-Gm-Gg: AeBDiet98ZPMh1c2wUeV3JWZTGYsqZ8hsrpasZ5LvOtpJ5tgUjhRBmCCm01JJykhnmY
	HTayM4dToVbGLeeIG4vc9umYMQ7F7g2pnpO4ju+DGdGLMTFlLmqvqlQrtuJcdVEng3WBV5shnZY
	yh9XKMUx+f5wIRpQ+5ze3fAz1bFg8puRcbm/uEc9N38JBp/LxNxTKcGR+fXCJL7lF+90XHB9M3M
	jtTT/+C8cglOhesto39d9o0IZSJ7RQdMC2AIixX3LQCWStA5ttdXGuizRvIdFRBOr41zxThCTZb
	FRMqPRjedNysPtKdLkObf2x77/F/3NYsnYxJbYyfhpJ8YQy7bJMFf2I9U1/CQ9kRjTAX68J20FW
	M8C4O9Oy9ADyB6d8ykdgtQDPGJj8iKU8/yUrsrOTMXiZrovo8A8R4DmJqWX2eyQc+p1mI27xAmG
	6juxhnVCxQTFvZ4EXsRtqLyRI0e2ti
X-Received: by 2002:a05:6214:5b03:b0:89c:cacd:244a with SMTP id 6a1803df08f44-8a7020c0f64mr41263286d6.5.1775214959993;
        Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
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
Subject: [PATCH v5 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Fri,  3 Apr 2026 07:15:12 -0400
Message-ID: <20260403111516.379795-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.53.0

