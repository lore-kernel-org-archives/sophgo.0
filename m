Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920269;
	b=hu5XAkJjSbuwfMXyaPd8lo84J5LEKqUKkIK96vliWndMj98HUvtMuFrU9/X16gAZZ/c/
	 HHypt7G7s5sGsS0j9sr+B1uRx+9VL3LetiaZE8dlMx2wQuBaEivZZvBrCtGZlj3lLycRN
	 hcLXUOHoC6vj9PSFTNL7UN4GagRmUBgpRqn63ODfSUneXGx7jn+/eiVoxgi+29ScQIkA8
	 45HPLt/x+G7jl4B5DmEzHDhE/OzDUc4A77sUnzgwd5VfP1HlII/LFS492tccE5JSEyHvn
	 bJvSdP5f6NjPeAAsW8+hgYOvByiGyL+FfL9sgfaouWeWMJDZa1vK6rbSzWRi1wIGJTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
	b=O7GEaDNRXso9NmCnawfYs3u2ZB7zhqNn6bU8uQ6BKp/rj08+EegXs5I0s+vfHuhvL7W2
	 K9Q5gB1bTIvWbMogzZvns/k/IOsr9YdaaqYhqlgZQlYWGrypLDRzRHwDQ8F5PYc0hvZPp
	 Y2k433at0wzLY0c0DcVKWZdc4uw4cwJzcVlItm6pH3nkBqKetcLl8WbEM9tvSfMeJs4vH
	 lF56Q0eTmCJ5YmGXpawEDVXOEWjXbhLX5pgvqGQ/CPgpsT0qGpWT7GXyFFE5E2/OHT4uY
	 gesUgaTwxbpJbZTDSC9Q3gdF9kJwBqjnHlvZvoSN/npyR8XygV/wHR3fQ6RiKyaEeZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y3Db0vFC;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D6606A337
	for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 12:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4D6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y3Db0vFC
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3791619605cso8289111eec.0
        for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920268; x=1795525068; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=Y3Db0vFCmmiyuidjjHAZXhlYM5iDP3XLFOAxvzp1X1/a4zpvlP9pxhT0sGz2vEBfyj
         E2KJPn0nOYOAWrkIkK17IfbKnU80v0irSuWyEY1aTXvwfdjQBSoCeH4YFxoYMoQ0BLy5
         HmIubBOfkn/hCfJOlFWJr2SgNiq9jewyhPEXm2T4PDjHw4Imn8aSpps46/L6pnzWvvcN
         CVoBmMuNP/wZhszGn9UJjypBiEwBYxZvyhv4lICuI5Bb9pDmaCKt+NyLECVjg+wrB1h1
         H+dSaeFNcnPLDWjP6H71+d5IEAtWYaHaWvFHFALT1/6N5hqAfYInTUO4glT9FvKn0wrF
         RDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920268; x=1795525068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=vtqGoCNdWjQMU3Ws2JXqBVFHJUbQlEyj0fykHdMHqXkPkO1tK5bqbt1V9Y5XLRYKvw
         hXA4JcPH8L0/skm2hu3gylLyXyKiYeiU159IYp6SAvDN2hCQDtrySTBHu2YkhzKTffY6
         y7yjZarE2MUrVPYSdk55vrxtwEjzB6vZA5oXNsWOtWZ+72gqqVNYXJmUlwNph/ZhSBj1
         /ws3w+to7Qj/u9O+IUj4nfBz/8b8X3II3JUwNXKybrX9f0REWaPkqQcL7DEQTMJfwg1V
         yc2f4WuKdjoAzaPqoZBdqxyjjMKU5FvRusiLoh//KwS3l1Y6SBWu6zqRnYC/nw92CM3N
         3wWw==
X-Forwarded-Encrypted: i=1; AL+hErHUposUkSOeycYnTdSMFQgTWSv1mcnurRqzn49Dj/iQddZTVLtc6Ps9KTHeKYIVXrsaTArfi88=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/qPCK7PpP4TfXUCHW/Sro5EiMljw6yvSdq85LQ4lQa2UK7kbU
	buCk/QxiIq0b/0nZxwgMh6gj+RC03HoAaWd9cY78HnaA+ljbe4SCxDWbmKiwMtExHCY=
X-Gm-Gg: AZFdTZc3oUUHEqAmSUCvnk/AYnFATuU8xiDvhYTZ21fo3hnf1BBCNkLR8zsqQoVaJyc
	w8MOjtBdkITxh53NxbM6a8uRg10UNdbDRBorMNBYb9ShYTMcsZaCgnQdPnPHqi0TFJnswvVh+zF
	oQGB+TAIbgyXKY6TUmPILSYxX7GtcCtYfSAhbtmDaFKnISg8WLp0ytliJ6GIqV5LdqO2NTg8J/F
	IRJxcVx+R1Myn8mpVck3uJGUcjps4nOvI+dvFuQF9H0Y4VN/GeMlEwrEEyAP9WJueZsEoA7vCSB
	OmuDTo2gHqiV1wbdExG/IL1KHpUxI3eePVCHxF50DNYVO67rBdWlBTQKFNyEcIU+KMittGOBfvR
	mHtgiX2FRA8CI7qzLBmWvrp0u7z4TQZeNcCcj9myMPcjqbpVlVeW08h4xQ22XlxVRfZ2E1ZAUXy
	NiSlo7XWGoYM2pJkdItZT/2VCF5I7wDQvaBH9hJnlsDhBqidjn5XOnjx9GaZVJfkAEfDAvZk1vO
	FB8quPFbkzb0zaT5yR8oGRzHqo7C61gWk+wvRU5m7xVz8q4Wtt1O3HewUnok7XR0UEdMkEnfIHh
	IdPXtOvZTA98jhdmoGOhYfgvor8tJvIKHBTi89CdCr2FHlcwOFZitSxWevvlrX1eexAnrJ6foIU
	bI9G5bfXVMctHQg==
X-Received: by 2002:a05:693c:4097:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-379635648f7mr13425750eec.1.1794920267749;
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:15 -0300
Subject: [PATCH 3/3] riscv: dts: sophgo: cv180x: add PWM controller nodes
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-milkv-duo-pwm-v1-3-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The CV180x/CV181x/SG200x SoCs provide four PWM controller instances at
0x03060000, 0x03061000, 0x03062000 and 0x03063000.

Add the corresponding nodes to the shared cv180x.dtsi, so that they are
available to every SoC including it, and keep them disabled by default
since the boards still need to describe how the outputs are wired.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index d2ec70fd515e..c478e7eb549f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,46 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		pwm0: pwm@3060000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3060000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@3061000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3061000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@3062000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3062000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@3063000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3063000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM3>;
+			status = "disabled";
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;

-- 
2.53.0

