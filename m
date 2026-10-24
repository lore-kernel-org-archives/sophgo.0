Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854339;
	b=Rc+i0CeodTFHLoou7BD0U2uzHgnJA5dihojtGyBCN2+zINAAtqrneVo0soFP8DaJ0Q8p
	 pKguhvy3jfTYGpTfUh2LXrm2/mosPd/u6a87X8B72vVQBAXnpprIPNnuCZKMmPNH/r3HD
	 J+HBgNhsv0DsL9LTjCeqjPGjXZKOxRvxZ0TTkVGXK+42ohlxx52dGOFJuL7oqyLGr0y9G
	 fvhCD8tWUQEVcrSD1HZu5lrELIC1gtsdZFNyqonZLQTLBrLP3IT1LPdxGgYtus7OhcbYI
	 5qqzymT4UxYoQmEPyDBSjfQVgU5beUXQ8IoQzw8qndIKbqiTIwrYPIuO826sE0sB3yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s6Q6qEx6BZSAw1HSWXpn2+zwrR9hDm7hVt8PFeLykIM=;
	b=L9VTa6bXghmAbk814wazaC7A1ALv6c3tBgFUhVYwi7B3+lTMwT5NT3IKI7Cw6m+ADxjm
	 5OnyF4seJZM5qp7BIRdwYGWmWodCJA+6ruHJOV2PrHJwcNU9qlYf2GpJToCxCKJqRdY47
	 OAO/A8TmKBJ6l45iuXlopz0El5oNWaNfSEHkO6qrRh8LtDoKNpz39b6I5/lenh6swa5M+
	 X8vFIQenLlaVDCZUJuQMeStsnWX5RugOzX+dr31Eedxwlw2qb7vRTpaIcfk2imdw3kw4w
	 Upf+pebaRcVqUHs3IpYyM/zF4xv7uqYaL1wy5AhyezAW5I/A6VdvgpBMq1aUUtA+OeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cOZzk9dr;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E1606A31A
	for <sophgo@lists.linux.dev>; Sat, 24 Oct 2026 15:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cOZzk9dr
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-355724d032fso228971eec.3
        for <sophgo@lists.linux.dev>; Sat, 24 Oct 2026 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792854338; x=1793459138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6Q6qEx6BZSAw1HSWXpn2+zwrR9hDm7hVt8PFeLykIM=;
        b=cOZzk9dreQLz3EsCD7g1dFCSELxKHNPwp/8vcTVqPzl1wiM9ucPu9D0qHt3N0s+CE7
         TZp819pJOlxML8J1WeprvwPmYqDvL1ai9w+Hw0to8468Ulfx30jRH36gV2T2eTnEckFi
         gfjmyUbY6p84/xpN99ns0+2uhMcZK0XE5F2Dx2SZKTzzA532cjy/u0BhQ6DoFlRC3IAj
         gAiZov5B0u498ESSS3nGg+6XLMIbgntSgpYPFAKveXVQp8ZE9ewuLgvGiX4j1IOBa0Ll
         B/FPjObUgyQG7/QygMw42ygKMudBIIPXCE9780dZNWbGgqc7dyo2P3Z49Q2L4osLzLbL
         sL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854338; x=1793459138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6Q6qEx6BZSAw1HSWXpn2+zwrR9hDm7hVt8PFeLykIM=;
        b=TzYq4AeZMhpR5AehNx8xTsjfRTeCedrvNj453Nsw5dojBF503tvPm4zaFqngRRIcqU
         mhzcppUTgep7KX+VgHVav/vwLfiCcZ5iypzBNoVRD6LkSnwks1El5ydNEmreY2Dm0VVo
         Pd76nPCApMPH14+IpBXmetZj34pz6TUNbklmnH9rDY8h/YpF9Z/cWuWWIJ7cZqz4Wxyk
         1BIIg6rY/X1oCbpTqucnE80glOSQyWIby4tfc6IZNdxvjbAV02RIo3WsQicoPgN2fPHO
         8hAMhJh/PuZL0aNpWQ4FF5Cx4/xbPJWbo+2F30gPODPsCo9VJlNe4wpDu3nPl0GOkSWK
         es9Q==
X-Forwarded-Encrypted: i=1; AKwUvByZDYrAU21yuY8N1Ok91yVZrfClp1sW9bPWz1QDokH/dowz83SKkhAbApQQcoCk6wYUdtrDbOg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIfSk09TASVygBMensbzr/ozF1ouKoi2GqlL08ujTCVZ2ID0uZS
	EcJEuDqP+aNgmlKwQl/Ngxi8+7FBfPISbRw/HMfbQNF0CiVuz+fBcH16
X-Gm-Gg: AYBFou2SQT01AoJXJ/c0VKjudr7Sb7OKOAdFBiFe6AkTYgcPm4ZqkQDsx4zEaA13oAl
	SlHJyth4VS3i8W93ML9FVFuFnXgih8/GS09aWdDmv/t6jSbOEysujJO2Kr6lTOJRk50mnbw51ER
	lOHJMPB/bqtsz12zs2VS27eWWokzA65WYxAc9Up8DKTQFenVpo3yROMtiWEG0yBY7GzJErMu2if
	RkooAZOT/VfPQgEz4QOndTzJ1qupDgbsyki5MqnRK+3SWSIrx0rwCwo58JKmSANxSgejN/+/4rw
	a1eLE5OShRlOgX/6qBpmKtT3COb06Qr7whA9Lp8AJaYZK5jhMBBZoI2oLgOQTrFFOzr0PmkiU74
	0sFTg7+901Vz+d7a2ijgIE7Hyogy+JzXaYaezIOOrtdFtaFBID+mMUBNnUkac6du6EElJBNMkXk
	iVQ5Bm4u1IEaB+IVyGVCi9oI81tq03oj8/uGs9O/IXvzK98eRbKptK5BumdCj4g7hidO7eoeeki
	DADHn9QOLgR/Q1Br3HVeQw+2//VBdMFWISfJEIuAuhJmNX3vj1rTA5HTyVvJhMHGNy+HaSi8m28
	2id8JHQM9EH1NXRp9zv8tv07slH3q0te0yJw77k=
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-369e821311amr5053728eec.0.1792854337621;
        Sat, 24 Oct 2026 08:05:37 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db450bsm7393778eec.17.2026.10.24.08.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:05:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	sophgo@lists.linux.dev
Subject: Milk-V Duo 256M: USB peripheral mode works on mainline, how should dr_mode be handled?
Date: Sat, 24 Oct 2026 23:05:31 +0800
Message-ID: <20261024150531.939657-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi Inochi, Chen,

I tested the USB port of the Milk-V Duo 256M (SG2002) in peripheral
mode on mainline and it works. Before sending a patch I would like to
ask which way you prefer, since it touches the board's default.

What I tested (v7.3-rc5, CONFIG_USB_DWC2_DUAL_ROLE=y, g_ether built in),
with only this change on top of sg2002-milkv-duo256m.dtb:

  &usb {
  	dr_mode = "peripheral";
  };

the bare board, plugged into a PC through its USB-C port, enumerates at
high speed:

  usb 3-9: new high-speed USB device number 53 using xhci_hcd
  usb 3-9: Product: RNDIS/Ethernet Gadget
  cdc_ether 3-9:1.0 usb0: register 'cdc_ether' at usb-0000:00:14.0-9, CDC Ethernet Device, 12:ca:4b:aa:b9:31

ping and ssh work over it, and iperf3 gives about 111 Mbit/s from the
PC to the board and 88 Mbit/s from the board to the PC. No PHY changes
were needed; the ID override in the top syscon can stay as it is.

Today all CV18xx boards set dr_mode = "host". On the Duo 256M, though,
the USB-C port is the board's only USB connector, and the vendor image
uses it in device mode by default (USB networking, which is how most
users first log in). Host mode is needed mainly with the USB & Ethernet
IO board, whose USB hub hangs off the same controller.

I see two options:

 A) Keep "host" as the default and add a separate overlay that switches
    the port to peripheral mode, like the ethernet one.

 B) Make "peripheral" the default for the bare board, and have the
    existing IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
    dr_mode = "host", since that board is what needs host mode.

B matches how the hardware is normally used, but it changes the
default for anyone using the bare board as a host today, for example
through an OTG adapter. A is the conservative choice.

Which one would you prefer? I'm happy to send either, and to do the
same for the other Duo boards if you want them kept consistent
(Hiago, I've added you since the Duo overlay would be affected the
same way).

Thanks,
Chen-Yu
