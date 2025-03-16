Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C471DA31F;
	Sun, 16 Mar 2025 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151409; cv=none; b=SXg0r4C6NDtHgVVeqAbF3hC4tYnWQf5J/Y1FL08bjxbgzEab2Z2eANqjA66CyxBIEtG34WQ5vCWwebDp+Xtt4CbuOBatnCiZePkUob2rl8PzlJYuBPYVsfbE6IT9Jyg1RBMD0muBVDfjaszzHQH2nPphGX9m/evSMuYCUseLpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151409; c=relaxed/simple;
	bh=sKVSL3M4/KD93xYcJ6rjVSTuBGDP3/FX4AyXzkFXliI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYQxGDz/o0xLmZNcYC4EiqSbnVlAPcrnETFZsyMPfpsTd5DdvesjSTD8Oq9eBiWDJXcZCqr0MMoFR9+S21JYwAWC0O7yIirjsJ4nco9c0wjquep6WGyZHuoMQX5jYb/hzNVbof3ke7g2g8ULAFog3l0twmgurD/mzkNFXttbLVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkBRKn7Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkBRKn7Z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso8427075e9.0;
        Sun, 16 Mar 2025 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151406; x=1742756206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzk2teZVxdXMwphTfuXZGFBjNByuLEoXPWf93JJtGZY=;
        b=QkBRKn7ZaiRHOUOyccRaVZJ2NOCvD7RAhaRC+aYhY9REDRPZHFDsm2KXQfxrTw81sU
         tsB4EtTr/9oJAfmhbuQgmpPcFjXaHo18Nq9ec3orZLDq1iFmUPhewFr5+7GmWM9EhYt4
         lba62ReVaG/nnO2GunvrtYUsYQAhhmiCfgbkTgXWpuINQhbypyRXROoLFQWGP/Iufx2E
         1mDBNEZKY8WtV3Pkhhu7CPE4S4uAjjaHHI5xpAl4wOc45aImTopTs4L4+Vil9b5cIOEu
         AYfO47u38wK5OAp2fRoO1/1kdT2ujoJ9kz9TtQA3HP1dalvS4C+ncFvSkwTcHnzYwj5y
         aTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151406; x=1742756206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzk2teZVxdXMwphTfuXZGFBjNByuLEoXPWf93JJtGZY=;
        b=AqB5OMQ9szj7BeGDB0uv52eN54xI9qoPqZO9UHvxpZwshjVYMF50QNF82w3EzZsHeb
         YFmSAgTR0RVhoWbY1OFOsc3Jle+EGh1fDn7rb4tSXHV+AoIDa3dXWy1cJabMJBCJ198O
         XVyimFFx5iAnLtYrPfprq23oCZX5j/0nIsOgYzJgxMiMAFMSfkARsj15TEnYJyN+b3+9
         dRQv43XTMj51h48DZm1EwZZpFw1fxbnLWVbzFT8qErBQSdG1ZrytpLIIK4t65yVWn2Hy
         KSNUHA+wh2xnw40xVHOiy9dovQb/8VShNOWe/9fhPmr9PkUGejTH5QusAzpxKyjThQkT
         2C6g==
X-Forwarded-Encrypted: i=1; AJvYcCWGrVn7pnfF3SSpUHW2TcCLvEQ7KLqruy3PrlIEBpbi1i306nrjzmM6TTUQ6dvkJXRwfY4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuEIGEkPKSKcXVCgkLapVDOHALOF+yolQPjT7l4wMg8AjxgLlj
	R3J47l4XAPzvTGdqES6x1aG9i+HxagTfEH7631RfQSBHtK8J0h78Qz8GY1PL
X-Gm-Gg: ASbGnct7dOk8WaPue41250+J+17J0nzhUGRKwNI4qRlf8L4k+Ag8IRFld0geFCOGb76
	LmXxm/IDz6yadrTIWrixkLgKS4EraKfWFek2n2VtoIotb5JpvbP/W+2VY6BdR3POfXZ/3dcm6+Q
	dXaetTXj9mPM994vxryCLYSDW4HTRgGZJvVGKhOkRAVAwI62KQJ+LE2F0oFEwFKEOobyAZG55z/
	UtFKW833sZIgKcvLsQwNPwbhEDisSamMrNIdT6YmypIW4QHC6ZDOK7Oi1czFZnc19EnnJTRPn2M
	XwNP14asVe5U0iZiFfRVyKCJnWalriFZI0tplSXRgExfrnG9M+J18IT9QQ==
X-Google-Smtp-Source: AGHT+IECHd83CexxVzAZ8pNQZPc8xCrp0cWv1eBYkNmKsGFINq/gOCr5P12MPmJNN96+kopi143wkg==
X-Received: by 2002:a05:600c:1f1b:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d24e78c6bmr67452775e9.10.1742151405638;
        Sun, 16 Mar 2025 11:56:45 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:45 -0700 (PDT)
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
Subject: [PATCH v5 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Sun, 16 Mar 2025 19:56:32 +0100
Message-ID: <20250316185640.3750873-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
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
Changelog:
v5:
v4:
v3:
v2:
- patch introduced

 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index a14cb10ff3f0..5d73d0ccc547 100644
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
2.48.1

