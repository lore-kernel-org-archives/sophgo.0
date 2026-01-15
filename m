Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AE2F1FDE
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504695; cv=none; b=Y9htwWNiW0mJtQ72x6WCUR8uUf9/lWhjuapIppNUHtSd7gf65H0KXX9UULN8QcAMXN7D1wOYjAbU+5VHcdoovUTEIsGs3wG01owEiqQkoFGVRSF7ko40tPejW9yki/hpu6MO6E5G3UozoVhDdZ7cwid+gIgYMZ43p7fVG7uS+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504695; c=relaxed/simple;
	bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGiZtQp0An133kYQ4Zg4GmwhW0BmjIhXL2uZQQxfFeuVIkwHH412wJB49FzU+704EfBtrCsN1QWaCyD3obAys3F9ImBHUp3mqW+XM4EeV449UVAgbDGQMHOLirgXUyLrc4jvz8sCY3IqSd8T8YAQHHUPtsxun8kglRBvzbLxKj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWhhdgy6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWhhdgy6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so1114870f8f.1
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 11:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504690; x=1769109490; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=VWhhdgy6dkTMXFF+AMCPBbCucW/RSc8BZLjjozy8mgxFZpgtVoe2WUFxUGyY8WkOW3
         KLmjN/rCgwrSQdB4HJoTmyDeJiWtWpt04chQhSNAriIqAxjn0eglfhJjvbeVGL6gJU+6
         XSZCcxGtCyY+ZcelVvWY3MMDoFhBnTL4ddkw+DuA/25ys5VwM6ywLGoaFjrbeeAT6z36
         FpMb2otlGW/jZzQ5z67AdCFTUIE2dpq0ucbBRfjRAQ0EcJtKC40bFSK/ne9nkk0FGFqo
         8WMZ/+VreaV5dSRScucchP4eOLCmu8oyCKk5pb3vfwhhhtWwnzkVnkDHXHozYxTNptsc
         qz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504690; x=1769109490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=TsCsMjP2jh9n0l51yKWnDY2CIlTVvIURayiTPbnFcfT9n1pHp1B0pOt9Iu2fTKC9kr
         V2XrwZNtYY93bCZSNRFj94g/3v7FVNIDAxh1jm1LxvZ25hLYWOZMD25jBpmSRZnOeNh8
         aQAj10Xwnd7K44mnYKk8Zrbdm8kS4w1fS0ooOoBN3y5EzQjjRC8aMOVsaH4KRolsz0xC
         6c+F1eSFDfDu1JnC+nXDgk4nMC/gn1A5egHcZ1RjTiS+o+wHb49MKr9R2ydXoLwRYlTU
         MFSz0qMDXCjdAYkGsE7C4jF1p/Vi2zDsu3NJzA5kBpogzFYESfjKBQpE0qVpdmJ12Dy7
         pWZA==
X-Forwarded-Encrypted: i=1; AJvYcCWiLstTAOFx53pF6Suj43Fy8Hxz9+8IRH3G8dpcUcNvtJBK+AiXmNEcHHQMGtKv5BJ94hZDclk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3RyqCXudM31opvUzRXQnrzUKIOKt3mwLOrINJBVuPAIxaCVwP
	QVH9sHDiPLF/N0SRuUMcgSVl6/hctuWCZv3nPujdviYSTPws6tszUEIr
X-Gm-Gg: AY/fxX4TGfYprZe0ErSKxXgS0Stc5m0HvWIlECOVL/w7gszadnKy1yiZR9b+88U0YrU
	3r6wSgeyxHw7cjbwK7bTEwgz8cFbBt6kdetwiQ9Gr2eKnnAkDVwW1WtAWC9iwUZihfcMbV+4B/R
	aLtv6HfWP1z1t9bEGMVOgdtFdt6JowXxL4O60TJNRtts1zTRpuVexCkiMCbZaYZKgA1VaElSN5z
	rJaTZYuehkZfNnAidXqw7g5K9xNWT4lAPRuDkAbwPYCFzWuVhV2FlEjQoxLmAURjf3ZOmeQZiY2
	MAdAq3THPbf4lMxnSMbM/m+pOU+yLeEA3FZ7omJtYplesEOB/H6SM8u0vsTpnwmkWAt4sZ1ywyc
	LjzgXxFOJIO2mK3wCYVJc6hCN6zbCpdnXr5cddMU3OUdtL7rLv4QnknJLoou3g0azAC8RfYhL1z
	W9YAZjJr53GY3pcBZtGeUjHAu5/WWWJ/0aaOd5jiKbwion
X-Received: by 2002:a05:6000:26c2:b0:430:f6bc:2f8b with SMTP id ffacd0b85a97d-43569bcf1b1mr533301f8f.45.1768504690389;
        Thu, 15 Jan 2026 11:18:10 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:10 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:40 +0400
Subject: [PATCH 3/8] dt-bindings: sound: sophgo: add CV1800B internal ADC
 codec
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-3-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=1630;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
 b=SQniyJ8r3rp4gJLKkMe/RuCjhYd1U6T6Xou1eZP38X8wwCyHO4bzGi5Ane4ARCg4LHldz4dOK
 Wzh/SCWOZwjCVC/3yMCdble9F+bcH7/0nBnSX9sk6GKlfWbbVy5qbyz
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC audio codec integrated in the Sophgo
CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..339b60e317e8
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
+description: |
+  Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
+
+  reg:
+    maxItems: 1
+    description:
+      Base address and size of the ADC register block.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
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

