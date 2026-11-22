Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346680;
	b=eOQPr5NnItrGQiaQ4Ffbzv/Umu7OiM95LXEQWpH5x0KJTSv7CKxTw83PGIrzobpytP0p
	 IrHhVdYF3Wdg6QR96nDDPbwaqA39OqFAz35otFuFoH8Tit49h5+YXs5hAPFGX6aHvtkTQ
	 SuqOrpFs6Qy4mrWepPeXcF8YHKmmYPUy7VYiMeUbWxn2mJGGGdjQwzdSIY1nGnUCxwDMP
	 8T0FpAGzvC3I+faOKKWNHCkpVWYflUtzwcQ7B8Pvv3RIr3sjmSHuTwf96XrilunQRe782
	 VehGJNRPUTDHPhs8CSBTZWgXOtxDYBtngECJCoFwK4xxkfcYIkhTEI5ok5GgSsfBtYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PIMZs/Htwz82mADxinMvXjHajQn3cdihqcbSr2PzE2k=;
	b=OWte/xG2xtkuJQhRtLMM9B+mrIu6PfxZTQnHIVgHGjS/6GKNOGa+ycU2MQPqNFBmBzRH
	 NgaiUKa0YX9pEtpvN1OyEH4nEHkV3sNKW8OjSrNDb1qVmyyG5FAFVfRX1yF7CI3tiQY/e
	 a0+Kmc4483x0RBNP6KSa+EIKmX/7OgkJVZBXS2uBSxvQ9RBPsdJBXO7C0HWuBEbsMeaPb
	 vEgJ7YafTe7AbAblLxs780e1KFgyhZumGNNeSO3wu1EkCZK5OlZvTgajgW6F/i5httTwG
	 kFuxI+DORY0GCJtYU1dNKRmKODROb6iu2cy890CnM4qp3lZzx98usBQtndVfFLmU2Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Z/r8XG1F";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00151606A320
	for <sophgo@lists.linux.dev>; Sun, 22 Nov 2026 11:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00151606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z/r8XG1F
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so21127075e9.0
        for <sophgo@lists.linux.dev>; Sun, 22 Nov 2026 03:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795346677; x=1795951477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIMZs/Htwz82mADxinMvXjHajQn3cdihqcbSr2PzE2k=;
        b=Z/r8XG1FHSpk9r4cCcVryWRgZwcyzQmLkDtymDv4jlo6gt9Eu7jd+81xlhvFiVkC6L
         c/zVtKTKMXXaXa+ZW9vLj7ajKSr1W8/Zi9eHHtN5gnyrUB3fsgdEuaa5dQ7v/o1PdCEM
         qr9zd+AZ0pzy/c1ntx2FUGYDFEjvfv0ulW8y7FdtBC4LZoKTPf5jCttlc6QQHmZcmS5s
         EQPBknJoymKekUr9sPO7lXowCgT8bu3Rwhq8nizBp5B8yLLjn9izFXjctiJWLonQXd5G
         mWh31hw3TraaRSy9bsd+RxjE8Epdrj3lZMmsSc6/ngK7qJ9GTb1HMoiW4/LNyAyWRhHG
         ZXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795346677; x=1795951477;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIMZs/Htwz82mADxinMvXjHajQn3cdihqcbSr2PzE2k=;
        b=VcN1APlUOg6lLRifWZvlQGZH2/WhsbP5J1RTr7GoIUB7QbFq7N3v175oh/XETikjdI
         3251ug7vaVVmGZYUnJPmymrol6re5CV5QS2NGl48ujDW3+P2vTASxp8AaK9ey4VXUicl
         1aym3WDN1BNeTRwRxFRGTfVoCCjlZEJLXjtcbGJn29a8e7+JAqPITjcdObMQ3i3Ss1P4
         5Ts/+Kya3rEn3sUYxqrKyHJOpt8ySln0A/nmVWJD2bojjINmTM+MpZW6QPtXL3weEXeW
         6yjqrCUzJWuUKjRIfnR+dpcnFewRdmFbmpXOYUN+Ug5V22HWzRWG9B2tyKce5Qm662Kp
         L2ww==
X-Forwarded-Encrypted: i=1; AL+hErExD6nLyBnTt+ahgMo58wl7oLu2z9RfdIfQqzHsiXAeteUxzL0l/GlhGVDhoV5T1VMCUiiEqcI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/YjI/1CyLXVMY+fFZv/acZLExScciBpsKdfWwGEiF4znRlnN8O
	B+c6lCTV7XBd5RUlf7CvX+CYv5op0XPxOZcGn2qlgvHhuzxOlKAXuwC/NqO40/vXE0zIWD7SgOz
	dtN9AHxNMHg==
X-Gm-Gg: AZFdTZfiBCNRcCWSZfSZwSRCEz9+mC/kutjOEE6ZX9IqAH/5vkwU7DNrYsUGo8blcbh
	ErO3YmtOGcu5ow3l4BZhsCAYry9PbkGAN8O7AYeIt4E0E6IcjiJoeJ0nC3kYwMMfv8DqKRrhLFb
	Ltvc3YD8KBIAAm4XpkaCoiP/6zEh1Pimcvg/3qMmlGjML7OMwzCwbmFQkQ9EZAD8pQuh8FKNqcm
	Mbfkcad1465LbZBQRxtcAVkrHU33NVaD6zG3xXyWBDQ4VEzDdKmNBcaRwRfqIYbXdChyfYzo4Kk
	IB37toStyYM8cT7YSfVnQ/jdge5qZ4MrOOJ1pTO84Ih1qP8sLv3szheX2XkOOrD03rEj+2G8yh1
	7nde+IFJpr6Xb9YBBem1VYZyV3gX1xtekwYSJnzOk+qhvFP/CLYlTtYTH/yPimPyypWMfkcRmij
	USFdi8PAHpQTWLaG8L7GseeX/4rchzA2+i6l0QgjkxUUUeARmQtwNNYYn737pcCwSBQ7ob5e2KJ
	iiMzyI3GVN+3xpystBwFoVfXGACWPPgnWll97AxH+GXmeYCCDcD/kmAUMpC/kGVdBW0p1EQSdcO
	YykSgTnTM4qU5LA1aWKisM+ZW3MILAX1s+vAMUgli3VfxKlC+/1G9iipw6GsQsr6NjiWEg==
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr168170325e9.20.1795346676887;
        Sun, 22 Nov 2026 03:24:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm102621925e9.1.2026.11.22.03.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:24:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org, 
 sophgo@lists.linux.dev, Phuong Nguyen <ndp2809@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>
In-Reply-To: <20261120105737.7461-1-ndp2809@gmail.com>
References: <20261120105737.7461-1-ndp2809@gmail.com>
Subject: Re: [PATCH] clk: sophgo: cv1800: set mux parent in
 bypass_mux_set_parent()
Message-Id: <179534666693.2640804.5201937916050830729.b4-ty@b4>
Date: Sun, 22 Nov 2026 12:24:26 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=202; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vTA6qGN6XffHkpfMEVingfg19fsOSrdJk4v8QOjxzCM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNlMF95OMnGysTxwfl789Gq19WemyZsH55+VsGuL/xPNq
 SKZLP6/o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABNJ2s3wi1nl8oL62UzZj5Vr
 JnT+fhX58WaL/ZT9Yq8sHoRU7t/yM5Phf7JDvOsrq+wNJxr+9n9/Yntu2/GJRg1FB0xEpqjPvM3
 xkRkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to local tree (clk-sophgo), thanks!

[1/1] clk: sophgo: cv1800: set mux parent in bypass_mux_set_parent()
      commit: 2c6c86e016e6b4394c4de23891423cfe65ba8d43

Best regards,
--
Jerome

