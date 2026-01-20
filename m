Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1714472769
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 19:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935983; cv=none; b=BYLaIiIR1CfKj+Bu8w/nHAF8EB7NvXBbufmG4IxLC5ILYXwHZsoFLJnTKK6xIi4BnyIsOKrnKTVJGokfM2TqfWec1flSO7L0FrDfCyllrCJeNpRFpqpnU7PB7d4xO6y9RgK1s5HSaIs/hxxlp8LUwJZUEgKBRIda9Fr3EiNxhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935983; c=relaxed/simple;
	bh=fackHrxNCrfa3xgCHjTAFP66CR9dRJ4J/Fkm/B2DbIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqnNEMA2NU9K+bFWeZVEiX45hu+VVfLK+rlxrgSMlvHft9P0lkwQixXRhUIG1MiqCR0VR1Jn1okmvbJtjaJ6+rfPHq7+51FpcdYnwrqd1zpf7groXfHkhKduZ+UbkqU/8tduj0JjlWdWIH7OHOpEPrvA4dfryRqwBFThcf6ulaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdfRwDiw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdfRwDiw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d21c411so20722025e9.3
        for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935980; x=1769540780; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GX032ri3Hp5Aag2ArhTas5Y0poDu9fr9e60o7ncMVY=;
        b=gdfRwDiwliXZthVGKgPRyDTHPOrMtvPkjpT3Ye4ScS3n8XUBsJfGD741DN+yieSANI
         4kkTW9qeGuyAPUBgpmTBAddXX8+/4RKlZfFwhSCKPj8HXKs0zuMxpOOj1ULaSLB0E6pM
         RTw325FXNcOnOCX2cktnMJKii8awxm4lnSN4+JgJDnRfl00MGFM/GT0Qqx9f6JlmAAOO
         /Q49T7igd1R9gkkc6VFQaA9phB7N+p9Y83gqamYb7s/DeZoic7St9YiggGOS3nEGSA6v
         CXJIy4sH6FKp8M2pcBK4c8BkH3hfhtIOMxrpQj/8dNjKsgHAW67xQDJBESXDtXybMY+X
         +twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935980; x=1769540780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GX032ri3Hp5Aag2ArhTas5Y0poDu9fr9e60o7ncMVY=;
        b=sowF5lrFAs6eBOrATuely2z+jQCdCOfWu1b0M4meQeL2csz7bWdc9z/JI97Suxsc3e
         AVDBeJsHpC0d/YbD2pxOoF6f2b6e7TiF+c87szwASkGjqZEKKzJKVO9kJMjOD3JYPeWz
         SH/7dgqXYOF4FdJMVpDb2BGTHPlsJvaV4PSs4puXg+6CVgiWv6K8p8KdaUIzdMdpxnTt
         ix3kG0D3hkI7zoLdif30/m83qCwGcMjiya0m8XZApSbIJPdiP5PZ51x+qD2HkA/ny5B7
         HkEpd3gRxlFVAE9PQ0xZi3Z2oMditN5WgyoFfRodgAKYNkVYekwEMkZ08l2vTnoZHHoD
         TK8g==
X-Forwarded-Encrypted: i=1; AJvYcCWJfIcQajl4NDi6xdXvzUpYuZwhggQKc5ehYRJ0ua2vXJeSEDlHnXjcVhFGoZlaJiHX7frXATc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ufAideK+arEOQmgzIaZu0OSSmh60QWn0Iu9LcM6Z8UbKFLaJ
	p3dTF31PTv4DoHqQWnJNRvJCFpYLEr8mSHRg4URp/7bNQMBRbJtxaWgR
X-Gm-Gg: AY/fxX6YmSUt+MZZ143ksmM2l7jzhPLKMWtiUDrfYO8qgzh86B8EsLVSBOfgN7SsDYI
	KhAx3XFjYPVUYgR6RSsc7E+1ADNMKGkjQyZyQK3AtjvR+c9ew1x9676oYZojBPAx0vzJhiWns6D
	9EuAiSxp2rEgOoHA7CP4+9VMvnZ1BEFSo14lCeccLirdxZfshxAOwZWuAV3R5SYrEEIPapsWZjm
	8ot1T6XHj9pYCGJVj/8NAHdBDblw+epIjYgHt9iR4ivTjUDoh0UAaiiSA3jQ5cY5K9tj+mUctJx
	ONi/zI3fkEXHhbeAUxsgZYopB7dbJKnjPTaRoaG4mZ3/pdIrbL6gtcemixY8fSQdejMMIBMBqxp
	DxNHdiAOAxRpPgVqQyXrX2x6DTQcgD3h/vfLL+Afoft9wExt3mne0CiiFCTgJad4EEa8lzG8JOu
	2uN9sfbu21pr8ln1p+6rzgyLwT6gwboKhMTiiaaJNL8/xY
X-Received: by 2002:a05:600c:a399:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-4801e345c96mr162137445e9.27.1768935979456;
        Tue, 20 Jan 2026 11:06:19 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:19 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:05 +0400
Subject: [PATCH v4 3/6] ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC
 codec
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=1645;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=fackHrxNCrfa3xgCHjTAFP66CR9dRJ4J/Fkm/B2DbIE=;
 b=MItEiN4e0HSpxL80NDn0eZTclssaZrsUM/KZNeFCT959G1OEcAPzPf8NwEb3wNWTi6MTxuqRD
 tECwH9+NBH0B6ZgBODGPQ8GWqs2kcND9D1gq1HJzvYB+JCItPqdJMhA
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC and DAC audio codecs integrated
in the Sophgo CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-codecs.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
new file mode 100644
index 000000000000..7293a98e98c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-codecs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC/DAC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description:
+  Internal ADC and DAC audio codecs integrated in the Sophgo CV1800B SoC.
+  Codecs expose a single DAI and are intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-sound-adc
+      - sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-codec@300a100 {
+      compatible = "sophgo,cv1800b-sound-adc";
+      reg = <0x0300a100 0x100>;
+      #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0

