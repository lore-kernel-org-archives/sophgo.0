Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB14244696;
	Thu, 12 Jun 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734919; cv=none; b=b85vSPoEZnEXPkP1jAEJf9bfgHxXsv1tX8RpNA+CrPBr8CWPnh8SluJcIzZPPMTc8O9L5HdyeceI9PwqUxFdNLXgDS1Qr8vEmt6+wIrqYL18iGEvU30RJ6iGWyUcpm0lVxMQai/RcEDSAlzz6ubVxLyTguav+kBg6m5M5g6jsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734919; c=relaxed/simple;
	bh=MUAMt7IyYN6ZQmmkvlBMzdYo8IOrzdeKO1Ry14nP/ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdM02hL19tDtWSo+pDk35hOSwFIRR9hNiLo4FZ3ycunlWlLmSzg0PkVu/3Ehbd4qQzvJmiKdwJvpthRSdWRVqvXxe9ae5ugxWjAsCIfJF8+oTX7Ib0nbQ79PUBNvMtOzAf6OCnwMgmi5bknwdIXy9IwcJihV7K/cOM6CsB0Ijg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdO8a5QL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdO8a5QL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso613605f8f.2;
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734915; x=1750339715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=kdO8a5QL+/eL4wgbCm8/McSd5MK4W59EStnTog7LdeN16dEFlqKWm5Q64Q2OaIyH/9
         OhywU/7joL4R1qogUuZ5YoJ55XsTQZTozsczRdiTpwAcCMAgPkTCRBqESc8xsPrHodzX
         kwA78ATz3SCx0lLeB419rrjFiDZd98ua0HGS/meQnNrSXMk4FZ7aIIvJoswSBP0CEHvl
         SohSk+rct+8/xvFDbYBUh2Jgh9JahIhV1IksIMO4iHMYLJWOqQ5nNAjJ11pGeKJFb+KF
         2rq3BqeoLJn7FUt6jnhO4ZWeAu4n+tzd8F8YCTCl1YhNiL2z61fhtlsy74QE67WGO/5z
         U4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734915; x=1750339715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=alqhrRvpwzSnfLVyD6B92ljKps4Qqfk7It8tutQo03hSK1AuH/JBXO0qa5HANHdZBJ
         DnVrz6uCmjT/J7iFoSVOg2pp7p8ZALuoKnxNXu3euB0eLKakTmC/PTOxMWHKDez6EteR
         B+49E8SIOVJvD3E3+utLWYUNq/7FXj5oZx1vwGiVWsyqHJGxasjoQC8QV9bwd566+aVn
         aKWmfoiBjzez2G2GdezoWbhgeqPVBE6oPQsysGuQvWN1GfvdPSvX/g0bqjq64/jS5+Os
         2umtUXABFux2CTq6Vw4bNd0CThhLxqAS8PgR0aCcR04YpX5iP1JGxfjPL+wg1GGz3izU
         Qvgw==
X-Forwarded-Encrypted: i=1; AJvYcCVu1oeczHZsfJAdHky7aXw/2s6qSqBxFNZoojLH9e5oWxT5q2dA7r4P/fVEtLCTKo1VZXQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTRk9sW6i5oAooM7X7DD+l7VJPEnB31xnCvLmAlVNghe16V2hM
	shS0Mj74Yf4KfpFk3u6Ybh5rPC6GJ/Jo6bAD9Zf31fb/2hyfuv7bIzEIlNbZxZb6yuY=
X-Gm-Gg: ASbGncuILk31Gt7kAoe9QCU6xEfrvCyApi7oqLHbTiNcrEEh7GUxhn2x5wn70g3fygG
	oLaqupfohA0iXESAhsBcDTKlCsFHL/OkWI3Ox88m5vDA5GW6fQv+4YvQ1g+2lPRCOGnkqA0zZTU
	/zpRlenN+tyZftrHspOvbPpiPL4q8SdeY7H/jF5fFAQUDzE8gyR95a3xwCTABHLHasOPPfFutA7
	EHYIFt5rvifRhnGzldD1NOxMLmFAwLMlhNfuxH6eIn1LS8kZhoyAz8fr81c57w4ySQ+YXuWVBAq
	2KMaMyUcLSGgl1Z9lMzmMDTcXAmrFWyZ6Jxz1QwwlE490sSJmwqyZ8aWrnV49+VlQzUhhNmrCZs
	=
X-Google-Smtp-Source: AGHT+IFWiGNMBdTBUMs7+0ijX2pUaO7IssAxRo0dN8J+TZrkwdKUEWMff5QxI4+ITXCstzD5fkIxsw==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5586dc413mr6122966f8f.27.1749734914690;
        Thu, 12 Jun 2025 06:28:34 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:34 -0700 (PDT)
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
Subject: [PATCH v8 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Thu, 12 Jun 2025 15:28:09 +0200
Message-ID: <20250612132844.767216-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
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
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
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

