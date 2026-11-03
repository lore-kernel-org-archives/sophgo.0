Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696356;
	b=x96+fYj88K2bBnKg9YTSa9RgHcjZF9kNJ/MM4ym2pBndGgd/u6ISZ5sJ2i31BjKT7Qv3
	 IskT+lfXmoC2nm9dJ8OZTlcdp3nNFGPAIcBof4QXlvNgvqqqEbHYayMffAAbJZ6g/xeeZ
	 hs08isDCz8WrrpXLSKxt9Ho+6mzARUn+4tmvSDipB9g5w0TNo6s3hN9aa+FHW+WkEXRys
	 U9EUJ7prAN5UZZOwjBCPVavLAZIObIoCFxmCZXnqG2E8gY8q4vGDX4uTji0JZSzgqthlz
	 QZ2HfqiKa2qDVT2BTkB8864y0l/zRxCYlIBtXa1B9w1x/vTWKovxQEDUnu/dl/qT0lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
	b=E/pbrQEJU3YO/9kfnFLRyLxex324rGyZ/M3rR2oaIVVoEPGpKoWX24GYLolOvX//YOuT
	 7JDbmvTrBLc1dZPQ35OMCQYxm2SX36AJ+//QCfQXQujtSaUWdRggGPW86BwKZpgmwAwd4
	 ri8IqZIpJZjQw07mJ7KV7HuIgTFNW7SxqAvGg2dF6ErGhfz3VINom2oFxOim0EgForAxo
	 Dx/wmf59av2Q3zKYSqNKBUGEPlR9bzvnOjEKZJah2YZcC56V6PvC9qr3H2DNDVhplfGN0
	 2aFcOIL+qCTiI6+JmYSOaIjphgkerKnSB8AdQKnORQxVETjZ5Jq5lfIK2AyjE31gvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1mzPbOS;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E28606A32C
	for <sophgo@lists.linux.dev>; Tue,  3 Nov 2026 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E28606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1mzPbOS
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso566773a91.2
        for <sophgo@lists.linux.dev>; Tue, 03 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696356; x=1794301156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=P1mzPbOSc7YGjapNCa5B9+ryDfPeKLCDnJ6VOy2OcspchgGFQtXA4Tlvv1wFahKYdp
         K0i99lPngegPdurqSRZIZiQeQCO5wma43/9FEiGWZ0SSNjVTfWZb8yhP7T7nxuWpK104
         tRFHiiLWYhksB4ADXX9dCxOa3g9CuAMwgFiBW7yzuIJykHXwthMd6yNepPL4bL5z1N3q
         y6zByIIBJX+ufWxEONLePPKTgpQ0H8Ukc2Ou6x+1NsqnLXlopnotVUHGKVxZ87L1PVA/
         UMBCsnRoJg7N/W3M9s/wEoDgX1O+TTovrwp9fLSOGIpZoT2MNAGs0bBteKBbeX0GUrke
         cjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696356; x=1794301156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=hDPwJY06avfNFxSQVl6f+XZDebhrjesv/VOi0FdcF/XTIECvSaaCuDtIxSG3Q3bIni
         hzA7YAxDTMdXSyJm420bOzg0bh3tQ22YRsQzpAc3lr8hWiqDh9ikbtNjJf1hfqnRgsTI
         kNbqx+Z+i5O1NCOA24YkaApA3hJgT/8la0zETXITEhxY20KdLBD4MpXlUSOOMgtHSSCH
         6EdxEIq7UOtBmC9zOUgLy2MDMQmUaG3pcieh28XqMrUe95bUs6+S2I5uopKr71rnh0xr
         hbnPuTPgw39KF1fGe7S6/Ixt/XurTsCi8pMUfh1OJEg0/JuLquJcodJg1UFAhlAZHvJG
         XG9g==
X-Forwarded-Encrypted: i=1; AKwUvBz7sDCQv4119s1Ov9NZ3A3L8RUge6Cu8RFYyy1sw6gTTuD5RGOwOT723uKEoiteMqoKwAB5MiI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/lK+sItzDYW861ob60C90yMbd/5RsD1ZTjW+od2KphYI4OPtu1
	V3wiR4r5yTSsI8gt/VXf4/Udt3iImWliWzcx4OJ254fAoZp9si8LtIVA
X-Gm-Gg: AYBFou1e1KWbDwBtcFzNrthV4kmqmhxnUlteSI9En2S4wTBOGV7eZqoCXldNaqLT90s
	ItDRYK2OnaXcTzOlD/LhWQgFfniz3jXrSV/jlMsw9POq2LuoU1LgEh9/hIc0KEZGhBsRThKplWs
	oPnjTpxCrUtEPep4Dy1aQQNiNQ/ICZ6ImZeqcya2+/WxRVkMx6+MXRFtxtfUaOki2vqFVxqGRi6
	kuQqXIDvQ0Ud7uwzxJlBi58SOSMpDTQpRfXzmt8CMBAOi27sJgKaBskt+z+njorovNPc14MWBNE
	tQ6OW5aYcg41YvtPBlqQ09fu3p1OB0mKprDjiaKRQ2FaWdkNCo5Q1efJUeEMirWYTrCZ+orm2Nh
	57Tk+irCqSGaIKeZGEeXU+NsMy3A8EZoAWcBvDvnCoikt92p6cbKxHwZ6o3a9QME7Q0ALKMKqvF
	r5W1qhcxZSFPZBvh1uu4UYs2Rjn0oxpkeg2t8G2lzlUppnJaofz1pDxo00ThkBGw5oQfO/Boley
	M4W+2HRKVtgAoFGido2611j5UJdWm6MfmY4etEhz51ipxJd7vw2FvlvG9nm3nJp5AvfhFkmG3RY
	inysvGXd/nubMq9/zlvLCx7ctCBeGN8py9Id1D+5CAIGdi+j2Y37o0oaHA86WCZPEsOsvEuWxmz
	7j/xRlPt9opyZ
X-Received: by 2002:a17:90b:53c4:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3ae8988339dmr19037670a91.6.1793696355979;
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch
Date: Tue,  3 Nov 2026 16:58:47 +0800
Message-ID: <20261103085847.338613-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB-C port of the Milk-V Duo 256M is the only USB connector on the
bare board, and the vendor image uses it in device mode by default.
Host mode is mainly needed with the USB & Ethernet IO board, whose USB
hub hangs off the same controller.

Use the role switch in the PHY so that one DTB can do both, and default
to peripheral to match the vendor image.

This changes the default of the port from host to device. To use host
mode, including the hub on the IO board, select it at runtime:

  echo host > /sys/class/usb_role/3000000.syscon:phy@48-role-switch/role

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index d4e86c15664e..0ad1dfd9449c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -105,6 +105,11 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
+
+&usbphy {
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+};
-- 
2.43.0

