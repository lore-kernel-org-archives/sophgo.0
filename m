Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C622DFA6;
	Mon,  9 Jun 2025 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512512; cv=none; b=IAAchWyDEGKSt0U1B/bKkn4cl6UnQpfifPPJN17/JcM2+jcSWmr4U/+P3ASQ4ZFPGfGAWJbmiMgMN2Ui6cGzoOtuQTOXq2QG+FWvgQjJ0KO83EUNp1JAhPPMDtgoUsjtCxY/1xM+cgjBQmJzukPWHit9GKHbLTg6wJNiKV+tkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512512; c=relaxed/simple;
	bh=ag0IxnzkMWAnYTP13+IFj8LREQUaFbVfxSQb0a51zeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1+aLNbWdIVvM/YumW57t06+/2Sa1aoge5ypkSFlSEllMTl+oKiUciP9sNgA0Ib0EyzXvGvU8HGOqARB8F5pY3aed01g4iebbmVGGn8ihzO/umllMJQtyA+sGJ6MoDlNfzHSOb7osoRJAc/pqzGMYUY0FqONja3PqhoNm/BBhU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgQpT6+Q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgQpT6+Q"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3937180f8f.2;
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512509; x=1750117309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=;
        b=bgQpT6+QiY/gOD11yW3QGvKEXTTXFLpDnt+XkjZj2KX0mnxsaNmBfosckR6jduSCvf
         CdXwJrcFVL2WTk5AleFeZrSLGDXnbAdXzwvpFzIOcjr8/smGKumosd4Koh7fOF8RGdpZ
         btdR+gB5ixMZ/sTacyWPBV+ap99XPuLBY7vwIECb+VjsL/vJmPOhsXWX22kBGHL5c5Wr
         TwGKLNH1obgzTvSiTCJITyQ6wvMXET90oUkiyaWRRH0qGAWWGyYBI4ATpcuWLOGlZ79y
         pL9/LTDzcc4SxHWP74tCAPTnf1HzfCt7dU3AuqLScWS9Wn6Pe+7XzCxULFVlwUOaH+tZ
         ovqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512509; x=1750117309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=;
        b=EhzqgzU6gDjtbrVdRrMCrELoNVRdYi1JQYr6eQSv55t491s4WVPc9oRm4iCg1PfoKt
         aEW5fwkHO1eDQfiN70c6gj1qYpU0UhnhFaQ/klx+RK5OGuy+LTTOcWDksCh2VmmJPEfX
         nIZn6Va57pPj5kSJacxmbxDcvVV7Zxm6LynqOkLgDBLjPMuCxa2SefpPPuv+t+fGrKBC
         WMgExD9rqvnDQjtDGAOwrZV19j1GdIkN0zwLM0pXFn0HCfU8iZs2JbI9jAaVBCU4ldvb
         ERqGrkL0WdjvCZm3RVBRwMJFzob+doavOiqby+hjjux9CPgi64HBUTABxNVr0Xsd+gLF
         jOfg==
X-Forwarded-Encrypted: i=1; AJvYcCWrPiGLg++K1nvVTMel59Rubi5hjxNF+GW6aHq31S0V3USIEvBhxerar6HeXSmNFxSTcAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPPHByyAA0q9h4R396cZYl7SByQwDykh0LJJlDgWDTgTkj4CxQ
	BCFMfMBgQDZhCSOtABngAmxj3jwe0wTaRhPJqOlMOVhR6jA9rR84PmtcEjNjLOqg6lY=
X-Gm-Gg: ASbGncsivQ/uH3eIE3CdjtmWbGKIDLQb2tcDqretTZEep3ASWwYOEOTuXZ3lHeYkE0V
	t/swu0kqDpLyVFUhyq4eLLLyZE+kReOrwe+ya91Mzl9RpmzFESQ+yTd1RY9agcyUCd04LhyqiaV
	2tgJHc1oZG+ej6lCKXWfpUu2EqRlGSjjoHE+EtwfYMzFmj+oD/W1+EGzRUeKVYfH5OeSQrKNqE6
	oJdyZBdIJvRMeaH9hj8+9I9gh9F7RnnajOWfipN5DmSjl55dCqMLjpO0uguOi/nQnEpPa/fPwQc
	w62QXL7Blf1ZM07H6cvigPyBeKGsbt+Co0KQQtn7c/myMzOmTAqieUQG9WDaune0HEDwpZpZ6SI
	=
X-Google-Smtp-Source: AGHT+IH7NDEGMIC05I8s3EhjGk1K/ehAcQxaj+kxcQV2s84i3k/Szs+b90p3CrDVe2+PWCJhk4iWsQ==
X-Received: by 2002:a05:6000:2407:b0:3a5:39a8:199c with SMTP id ffacd0b85a97d-3a5522ddf1cmr376314f8f.53.1749512509285;
        Mon, 09 Jun 2025 16:41:49 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:48 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Tue, 10 Jun 2025 01:41:12 +0200
Message-ID: <20250609234125.722923-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index b4c4d7a7d7ad..602c092b4ad5 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.49.0

