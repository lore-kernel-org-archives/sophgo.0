Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24153BC4EF
	for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840260; cv=none; b=BhH2nKg7sbm8QuYW6NbW88kSp3J2bla65rFx9YlYFu7mWqIh3umCKGH3/30Kf/K+DIq2RWHm8vWy27DgzWYJMkHvTdQZaTuEZ6bkDTQr5hpkLqnRcxxtDxTEPo1v4FDwNhzSVnl3gQUi7F82SPoXRA/LSM/yrkxJuv6832Z4mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840260; c=relaxed/simple;
	bh=Uu914q6UODLItA3vvK5l88VgJwM32DdfsJmtfwi/rkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htQauci3iFfuR5L7r1cCTi0AkQZJL2Vt5CJyOKKtFDFDsaDeVbBKGjQqog5qCZhYYJfQBcRq97phrtfZSc63n//X1/6YXNJlAW8/Q2vRHrN6gGwfUf5D0/j8/Xc7dSuibrjp/+08LhiFCLOKO/6neMKUFUXTTKx13xLvvEs6aLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4/SVbeT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4/SVbeT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee07570deso30353785e9.1
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 08:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840257; x=1769445057; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dO/w705OwMsU88LoVwjVUON1I4DFKZluQtaxNiuxS18=;
        b=W4/SVbeTy/1gLT8LqL5VH1yF6tNP1/KXfHJtPxjLv7KpiB9JzJHt9qzViJr2CfMura
         PxWek0P1o4znJiPPFarUhABJBCXDVw6IL69Wfi6doMEFJVMZXb//30ijw7aSJmp38E4V
         ryuDY1g4RNsKmV6noddN1TSTqYoRvs4FfNnRhCjnNvGRZfzxU17JOWNYNkXG1og4hV/N
         edqUQDMp9XU0/Ru8KsMcPXpIgkSp9FbJzayg17qWDV94tjYh+rdg6ooz9mwrswvmx0Se
         yp/tsUKc0osRVe2kVCAJugcAtV52AloB9TaMdBPgxxY3d5L5/Y/+V+5yCXa4Any37FSS
         OWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840257; x=1769445057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dO/w705OwMsU88LoVwjVUON1I4DFKZluQtaxNiuxS18=;
        b=tn9Mr0G6KKy+HTd8oXalpEJ0vohBdg8c9DQH19AMdVD9PN9DlTvL2dsLQEkfP6v79T
         qhcVqmZRGMXxAYfxuz44vGANYXxepES5fkTYk8wkO9YpTpBu9fin6vmjZpaQzZHoJNZC
         MFRp+Qgx6tlsp9JZ8GVHOJ82xc4UKKObbdMIebwl+0Cv/kSshY+uYVK3UtEGT4mjALrZ
         nuk2+nPI2oQnF+GBLa5P7t4/UN4cfgAGCiYipM6/uXefTqdWChKLKfxjLLXcuIA+sYX/
         BAcZDKi8eszgPEaKEuoPA98MD9XzxC8UODUeuWRQ1Bgd0O3mQzlMldriaboEYHq1Ksdl
         Qe8A==
X-Forwarded-Encrypted: i=1; AJvYcCVeb1Hjb8Wo5Jgv5ZEaczBgG+2hXh7RLrG94tO2dAXckzglPxwr5NLaqXOgJJ9WbgZvDig7G8g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAj1XWJrcKaIbtCCP/NTCozyDywKe5vBY6KjlEr/Q55KrCGbhI
	BznQw91f1cu4QE/hXuqDLMol4d4kBdVhDPhjUMZy0+Qvyyy3URMqeRLh
X-Gm-Gg: AY/fxX5rWRxk+HAMDwNhs+4CFTmlCX4xfFJW0UfQDQpQo0MMXVsTNo3a+6eammkC4wn
	6gWIUDUDFsXhkh3r0iowq/UvcT37idpf95hua+D4WhJ8vyg0qyRG9pCvx1PUiq0K9n3YPUXA8Y6
	zfymn+5EBef0YMzJwy/SCHvfafKfso2gitSC9HRyl5aAz4bC6VdZIIo6NnYFLUBLFWGnbjO9tjU
	Hnogw+4V6WsCzqy6bjCyM+Ix0qc+ITz06wP5OdzoO8Dw6HrrVq0Wbzw1NoPcxrWsxMLy9ehPfcm
	ZUjCDP6oA93oLPCHXdeppZFa8BmM++sT9kXB0rF2lgIfeFSqsQw/E/G22jx0C4juX9rwirj7qkV
	F9MkDoxQhQjDW4NvNZ01qw0TofAiLL+5qj0Fo3la5j+qbtj3zdPfTQcQAXB/miy2II8bomUPU4G
	E7RCmBVDGVOL1kXe56hygzeUpS0NzQBAZvZNixTTSYrXpQ
X-Received: by 2002:a05:600c:548a:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4801eb12369mr140158025e9.32.1768840256778;
        Mon, 19 Jan 2026 08:30:56 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:56 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:44 +0400
Subject: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=3011;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=Uu914q6UODLItA3vvK5l88VgJwM32DdfsJmtfwi/rkw=;
 b=nqI8ujgfXvOhrkF22+SO+FuPdj0nXLzd7iSHNw/zYATKuwEIQGxLxETgbdJ6NdnCicyO5vUUa
 U9BiyYztgEqApft9pm9i+stRZcA7NDW5Id/dBr2XFP185F3gMq6otZT
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC and DAC audio codecs integrated
in the Sophgo CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..d3b7e92f9758
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
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
diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..8457bddcea92
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-dac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B internal DAC audio codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+description: Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
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
+    audio-codec@300A000  {
+      compatible = "sophgo,cv1800b-sound-dac";
+      #sound-dai-cells = <0>;
+      reg = <0x0300A000 0x100>;
+    };
+...

-- 
2.43.0

