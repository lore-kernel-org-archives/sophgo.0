Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D7403B1F
	for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089919; cv=none; b=plaTMsE3P9a3rTtPEWHKonpm02lvEipLMfZEGFGhrzAPdx4eFcZlNjiGjCh7+3clReBLxIxyPUPVaNMZ7PSbgmemMvMVU0+84lk0OYstgpz2XDxXtzZYd9fNFv9b+Qz/HCNvaPWJT5W4tOS3t+CpV20UyOI3MJvh59FRIb9yH8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089919; c=relaxed/simple;
	bh=st8y4T5YN6SqtZtFwtiBYLCoyPi/Wo5ON08Qei/HluI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WlnLF0rbymsGqb8bHSkILi2awgs/PNyQ5XtEc0QkbhPDsoq5Uu/bQgxE6X+bwpV5ZVcikvn4QmTIbM+wUW6Sm0a6Bxy27DP9SUwaSgmGNUHCHlTXzOxN73LFLd1V9vWcL3NwWjV+yqQr3pQAtd6xSKAEiI8Ix8il+Yoxedjkpnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryX9W02U; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryX9W02U"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf1497de04so9542565ad.3
        for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089913; x=1781694713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=ryX9W02UQJD1ejiMGrERLqFQsLSUwJ377FD4jagxkLwm2/xWdfDP3E2hbPZFOf0Yo4
         r3EHqgesA8OcZ41+H7OOUQ05hsBFwi9NqSbbuPRMIHAWI3QOWXBHtYWjtH5cLYhcM8pC
         wAU2KnJR4Hd+SNCWGLSzmnhSfCFFqNugDAS2mrhUFFU1INmPe6b/BVFIoq5Y8QnsiPiR
         9Fji8CWKWsLmen1DovQsw7lFQhbKkSSrNAFX2hur/gC873rI7/KHSfhrsP1jkYM3MMwC
         q6xrPiiF0yh8DqPuRrG0cfR/vfX0HiVwCU4GDzJPShoOXnYx6rtFm9tjxJ5Ut+PZ8j/Q
         /NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089913; x=1781694713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=mxkbeS1rcIBeQvubOEHXZHekvILfhhNiM7tdQrLLWgKLLPleSGSXGhscVB5C1cxSnb
         GUc6RfbFm2ua7zhXkKk1oTEq5ij5AN91hH/00N2SZA6mqT7M+sVn3YyTtckFHqJdZhgg
         kUaEr0p3yVImPsjWwBySByp+thFfqptvHgZps88l68MZZh8UD7ZhjOL+vq2/VjzcXymT
         asCzffC8Jbj2SjNZNgTbCpa01wEvVa/Y/whZK0qg9tWLTzSsrhS+P5lRVwzwZkwk3nUR
         aV28LG/FklklKcUeKbJi2+wpe+poUkD5/pPqRsZL5MMExhB3Qp4zVvzfm7UFgw1FktE/
         e8Sw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ryo7y80CF68BFrXpxJlx4QdQ8+9it4WSgqU/8VlqZILYJBU+Z/iVkBad3D0Yv4ycbn77qIAg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9/R9MT8gKYvuZVKJ+iPoSPpbQrWaYzoeLU8fPGmamax4ewJL0
	+PpPr2+xyaB0miD1mzbhK937rAbBuzhFGhPhxpP0q/hU0QENrc4hx6Gp
X-Gm-Gg: Acq92OEhS3dlDP2D41R2O/rkmBOtVdb1mdkObWgdJSC9re+Oe+GWtPM8QfZu0kLgV2H
	0+XseBC7QtbxnEyfbGifMGcxAe+8TEpmbRrxrefqPQOlZzMsbSfxs8NapusTvEBSIy7x2QHDxnV
	O37U5lYUFZgf9DkkHssxxApFTzTLuFef2tLwF4cfVS3TKuujXeD9QC+JBVoKp+b0KXyAfoSDL/N
	hnNg8SKNMf0DGvPEReuXabBVl/7Z4WkY51QH5uAjgo6Uuj5mDCNY8MI6pCSAxJahprLIlyiwfvC
	cNIsFuzSgkf415p4H1WRJ26RV6+sihNLTbF1x+nMJHUtWSYeF1yMJDL33TtJVh9MTSXSR1XWuYb
	IAna8WiXb+PhVAw+YA4ovnRfBVzcAUXKuiNNLguK/K2FM7IZzWFW/JMOrr/OJ2gW5h+i1L2yn45
	w3BgOvvzWSIQxJv+vXeUqT4rMQzML1+1ECWyu6
X-Received: by 2002:a17:903:4b30:b0:2c0:b35d:ed44 with SMTP id d9443c01a7336-2c1e833b90fmr131974905ad.3.1781089913391;
        Wed, 10 Jun 2026 04:11:53 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251328535ad.53.2026.06.10.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:52 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Wed, 10 Jun 2026 19:11:20 +0800
Message-ID: <20260610111136.1514155-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

