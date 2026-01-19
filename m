Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A438B983
	for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840253; cv=none; b=NrjMd3UqxORLtk7tK9R+YP6kG+b7zlRh4/+d5s0m+whTWtZY++PfowA9xytlITOEl/4VMI2IhhyNnvbKyI/DCVLPDnt3g5ETiDlPTyj2kgtOvmszDluuynAHLPAnamkoGX+68rKeDosNhvzk38Fkc5KCKtLcUYruuhQJMDd2/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840253; c=relaxed/simple;
	bh=D6/3vLfrvpSmRRqAGiIOVS8ewVjwKf7GH3zoAMxoKHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukejeauGiMCJzhzuI5mfYkzHQJnwLtkcbsnrfFAiDoGb76Xsc4AxTLwJoR9yj5L5sRDhxCQsWjekgHXSHQqPRuJiqX798TNHm7TUBLuc6832t69m1c/hyfIrhNsB6Mz3TDv7ZG94vF6Fj3OawEqFUNJuU0zCNF5PtYxdZkvLHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efzWfdp4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efzWfdp4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edffe5540so39370115e9.0
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 08:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840250; x=1769445050; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQd+WNzdOao4inqLQiN4ne6FLA8M9wMTcCMhupP8Doc=;
        b=efzWfdp4qp45b9oERhKV5R/wDfOFBJ63asR4UrwMV00K28O+1iTsMJfHrHuhB1RcKl
         7GxWHiG3Nj4z309V7s+CHLQwW8D/1QyLHg+MGuqrz7NhgAVzZ6ZtF30BTG9t7N8omf4B
         L8VnIiuhutYi2d9YsGQyU5Bo3wyBqA3Km8jm29ZlrB1wnTzt9T0xoEaHZXES8IkLDM9a
         e9IygWsDFRd0918p4a0GqMc1ANJ/tXqk4Quf+NSNFUffBYJHqWY9a6jsWOzeodfo917T
         oehSdTKNuc3h4Xemf8Apn/N0a4W+X4xsBs/xiJkbmw1X/Mnaf3d4ihMOOuMRqjJ8yInM
         W+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840250; x=1769445050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQd+WNzdOao4inqLQiN4ne6FLA8M9wMTcCMhupP8Doc=;
        b=P2aTlAn7YhpIcGAlN5HHUKCYGArfTu+mzzbsATNcOPSvGcIq7nOhE+Bwmcawi0Te0Y
         BYNJeq/2QMZK8ludNGEG1L942B8zGy86OutqYmAYRNprr47SsyEhJi6zcgss+6s6Wq8Q
         LuN5I7Dr32nzPlRZjES8/d60ZHUygjrnXNm71t8fIzfnwiv1vMBce7uBevU3cTJEPf2O
         QozRDI1TiRe81SrebwSlXNH/kWWNN3QSPWumsUjw2HHLAflyKg/zctI8b7SzCz0ymfB8
         ja0Ej4iju+Q4+0VRt5JZk6mAlvWAiPaB6lpY2BsPyzPo3/aiPg6CTc0932YPA3nxzUAq
         mjTg==
X-Forwarded-Encrypted: i=1; AJvYcCVuIo5T8sOGxRfDrHGIXMXxCE46mG8gMGJX1tsc/42Hj1/e0K1TTSlNsD0/P33SviYCvOfIi9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOrrBg1I6cUbm4f5+9BdLX8Au9P/13TU5sr5U3NWtb4RgqtWzf
	TqgCMsjqq3uQbMkUg79NE+faBCk2qWucgitPF+eNLrVYZFQ3PRxPhVLL
X-Gm-Gg: AY/fxX7uNGcn6HF+NSudPjLtTqp4XPGzPKZumvPaCz34JnIPlrJa3v0HsglpqUUrnGI
	FAI/yBMxDhSqDBvdIZfQNA82vmRVEFTBsFKNtE08AnCI2LDuq8Kjt+J/58beswEFbdAomFRWKiR
	im+n/dBmwZrjWnEYPowSYaKDkr5dK3G71zWiq9dTnX7JZD3D2aVnlLb7wMCFJNwJ5wcYkmezqdf
	TLRfOuBA5/lHERUGQWuCy87LLrbuP1hjOBq7fPTg1P7/GK2IKa1ik+neeiTFJtYx3Xwa3o7g1EF
	VV10j4ounbpdopty1XGcOsEGKaJk1L0HgxwUiKOdETcHO6hgwCrOIH1nCcD8uhSkJF6mZDSDBa/
	iLE5y/NKm7FMwxIIl1SCOjR8EtN1r+W5tEr5UEKyYKkPJqVw1Lj2f6ltjhjUjn/DCha46ctaXgn
	35RUcKAaySz4dgzh/yoCmp/upuCQzkyiyotceO9bhtg1V1
X-Received: by 2002:a05:600c:4745:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-4801e33c17fmr160556445e9.24.1768840249805;
        Mon, 19 Jan 2026 08:30:49 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:49 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:42 +0400
Subject: [PATCH v3 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-cv1800b-i2s-driver-v3-1-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=2363;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=D6/3vLfrvpSmRRqAGiIOVS8ewVjwKf7GH3zoAMxoKHo=;
 b=/bjUfLKwlPnlPfk4DYtxlHgdXcY+lvP5GNMVM9VYSX/tdxAVVMOnsLQRkscxApXqhk58aE6Oc
 t8x0QPnx4PCCorDSC03hUrqySe6xs7VieWCNdq16mJ1+n/h65X2Z8w7
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

There are 4 TDM controllers on the SoC. Each controller can receive or
transmit data over DMA. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..e09631308bb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [rx, tx]
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0

