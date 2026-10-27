Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086594;
	b=xUeToYsPlqfa7sgrcoSqR1u7rX48w0qSLxL/RplwNqeIQv6EsO8gm8LyDhFOoxXx/9Nq
	 dXU59zCQOfHq3nzYCO3n2upxc5k+rGOU4BOuU05GGQIYbVWZiHGak5LjpfLQ80VkarrTr
	 kJnENUVUB/cEDu5ZkvbLkdvABoiuQLh4978KhyAfrr7gg1iOSPq1QDOvqJQl39BYUKC6J
	 dW+EHEFUkKGb2FALtObn8xMuXDMnZI5uB7mi75ZiVsGyR9XijRwM33x4VPFKThjbbSKAE
	 Sq9NhHDXbMVKV6Bbal0nMR37vf7bIO5vFSLxh5AQTZNXFCOv/X8xNlezm3VT2l62keA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9Ne5+V/H1rJSrwzcgI76ZaIgqTgiowAdFEegaCsktM=;
	b=ss60lPatFwpM2fhlf6z3DLMcLqzJsjmSZ56EveRrmpPwxxYdcZ7FduvWMBTHYMu1BPBk
	 UHIqSKqKghXKgIjYIq+0wjcWF7jLzmce4g8zVlTDPAT14aQyf/qnNImqZMqy2CAYfQwxV
	 QOwvIn6ccecCI8BSHre8tVbALSi4Cf6lNQB3Jtoh2yLeiTjKjJSn2FN7rLZm8LQs2JHKB
	 wVMP+oxKEcDw4z1uP+bw4tnVvKzCI3rmStyqXAvP3n4oTSHr88v7oXAA2mS48QYffpNu7
	 U3SoYuOrw29NKwcpnMvYESz6vM06cyD+pFRt4TndEPrqwjkRLFIXZrsRHJkEAFRaFcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L44NaUFv;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E8060A380D
	for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 07:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E8060A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L44NaUFv
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so448813a91.0
        for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086593; x=1793691393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9Ne5+V/H1rJSrwzcgI76ZaIgqTgiowAdFEegaCsktM=;
        b=L44NaUFvhOfplXIxCzF/YsmSW2ZUCLaeyGD9nnWrz17/4WI/MpitbDBM5/knTZGjwI
         X43d11WXlFR1DpLB306aLnB0xeWUop665PfQV/p0rg8YP0qhy1aenvQF5CFkFxdzE9L/
         GYkl+0LAT/h7CCw/iylUgVBnidPSuMjdBAwvWc1wEUgAbDWP+ryGK6mbtAE5KnFKYNeo
         +OFsDSqZgXWF9yKw9lAtJx7JMtCWDPeLiGplmDBoGFysbwDD7EHKdlSW5quU8Jxvs4PW
         XdMiYiFw2NmgaBYVq6txuefv4t0Yl41sRKdytwrZpS022diVRJr4EKkoKskTZZioeBVr
         8CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086593; x=1793691393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9Ne5+V/H1rJSrwzcgI76ZaIgqTgiowAdFEegaCsktM=;
        b=hyNDRjmXQ1gYuyqExbk+6jmIFyhLa6QKtjf3FgiL613wRjEb5MLlLG4uhcnbTte/vD
         9fihwimu/ijjNpU5RlAMfYyDLilj5QUJT7wzCJ8MzIx1i1qYtxaFOJaCYYxWH4T71cAy
         5Enm824nNS/Rvw/t6tvWdK9OQNGPRJU8jFTreUCcM0/mSiHF3cyZhZMojmRJJdt/YJmr
         PH0v/6FH+otWA89P2pQdVp+ZIoj5rT8nmPAwgWVNiykxyWi6cyFmpkXqzrjS2LcdNOwk
         jyjp5pQ2gHUIm1StDDfwTcQUrEaYv6ySqqRfzU/GA829Y3J/4fcqUH8DYF++GNWG9NCk
         BcrA==
X-Forwarded-Encrypted: i=1; AKwUvBwRxwe8aaQfK6fWCqSJgfiVy+evbPBJPPOo/kFEVjcdJ5RTbWiOjiTVEQn2nJeQauziHor+wys=@lists.linux.dev
X-Gm-Message-State: AFq9FYKOig6segZAEfapIweZ0+Twt4HjfRKIh1vtfypn3z9ec84qCPZi
	CHtDAT1iEnInT+FCYF+yVcP9ETjt15Q0Cl2MtOUfe6bIEMmdIXWCaGA6zONAWvwJ
X-Gm-Gg: AYBFou33d7Xie7OiUt/yGoRl+iCWy5YFMWd3T4Iq0cpkpna1vBKgu/zDRSwCzbommws
	rWiRi+nkciSO9gdCIGUJJe3V4KUgfKlnFK5ds4VSbKaXHEtvnl4k4NIv2/29FFWNBmK5Dp1zKJY
	EnosPZwU3t6aYfZr5LUT7osVZnlPSANMqQoEmdfR0XzQFSqQefx7ko00gw9chfpEDUXegPrd6Xi
	swgwrTktQB3AMy1mrBcnCHXyTcJl1tm1WlI9PWrt6Un72A1G1v9GV30j07BQcwvpJ/cH3buw1A4
	nbhK9Y0Nryl4r5jQjDnOSCrcnyQvtC2IPjD5TZCoLqEiB5weag96g104AiLfm93cgapR25oU0C7
	a9AEHQHovYWyO8RzXXATWyVPyZP/su4RRRnL5gN/N105wjUjbYigBr49ggKz2xgx8GfIr5KxLLc
	ebwvQxgoTQQYjJLOUNZZhQifX8c/F/IqPOIHCJIISp7DNJvkRcWnhn5PCK08XGNYjqXdNCvmPql
	3K702QOv6rWU3XWxqCPKB8Rpv73/vAl9RjUWulLo3T3AycrTqaPmX+VNzJ0jNICoJGdRnK0tj6m
	Xby9yxT9yYt6/1neZj7rZvjbYJLJRj+b0cYQ/HU=
X-Received: by 2002:a17:90b:2d84:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3adeaf9ce48mr13522886a91.4.1793086593297;
        Tue, 27 Oct 2026 00:36:33 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm7995982a91.2.2026.10.27.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:32 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <chen.wang@linux.dev>,
	Hiago De Franco <hfranco@baylibre.com>,
	sophgo@lists.linux.dev
Subject: Re: Milk-V Duo 256M: USB peripheral mode works on mainline, how should dr_mode be handled?
Date: Tue, 27 Oct 2026 15:36:26 +0800
Message-ID: <20261027073626.975104-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at09avHegBuX6Evc@inochi.infowork>
References: <at09avHegBuX6Evc@inochi.infowork>
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

(Resending as plain text, the list rejected the HTML version. Sorry for
the duplicate.)

Inochi Amaoto wrote:
> In fact, neither is prefered, the right way to use dual-role switch,
> but it seems like broken. If you want to fix this, feel free to do
> that. If not, ship the dts with the behavior from vendor.

Thanks. I'll look into getting the dual-role switch working on CV18xx,
so that one DTB can do both host and peripheral.

Could you tell me what you saw broken when you tried it? From reading
the code, my guess is the PHY: with dr_mode = "otg", usb_add_hcd() sets
the PHY to host mode at probe (ID override in the top syscon), and
nothing sets it back when the role switches to device. The PHY driver
also treats OTG mode as a no-op. I'll start testing from there.

And to make sure I read you correctly: if this can't be fixed in
reasonable time, do you mean I should send a dts patch that matches
the vendor image's behavior (peripheral by default)?

Thanks,
Chen-Yu
