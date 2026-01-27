Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E61328B6D
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539720; cv=none; b=LXE5WAeVtfUG+HrJdvxt6y91Z1kBzyLzKLQ71YzZTd6S41QG2DW32d7WGMazNhY1kfLWW89VMLHHXOofO/ANvUfSvjX2bIWlg5f6GmYK0wZWOA4+isaVNmZNBec5O3jiucSRSgocB69cDEJhMeQPLxW+SklmN8LOjD36t+IWiZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539720; c=relaxed/simple;
	bh=nzQYk89pkPHGP6R9yMxHj/NHVae7UpktsR44AHN8qy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I46xct8oEWWtHP1i4B/kpP0YbRi+BOs1ZX/3zULZLmhmzHjJy5sbS/wn7Mpb+W/6efafEKCv9ScreQ+Ww8LykoKeuxIiissHDu8wL11W7741I1EY8mqBb+x/FV/U3cp2tzrshdG85cQNvCbNPUEaFDuMMJr6R4IMoWHWkc8YztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTLbdOrA; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTLbdOrA"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbc305882so3689131f8f.0
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 10:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539717; x=1770144517; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIPiKXcszSKqC5Pe05TjPejSszZASfo0tqdtxtTf+sk=;
        b=nTLbdOrAV7ZUJGhYyk+Q1d2HL8DamTdybu38sLX9W03fpE02I/mnfBFstMOnIDXfk5
         mxZ3Pr1duv8Ws3jKze8Ef+xNnZZB0jLWcxEht1ltHVIvnMqJ+TE1hzqlZ1Bz4E+Tm8aj
         ietG6/HQJ3PYv6hzmjd+tBpNlFXshLdbL6mTOY6s6impjCniW5lDl7XB+Uve/KMvPKDZ
         Rw5KFbWUELsaK+shIuoRpYXasFBeFQPRlwbawga3Em+H/S8UUdjzEX1o137oCNMze3/v
         fAAsejyS0tdcAxWVb56gb/AtS0CKOrKVkWxqrL/6KcQqyw6KcIAPyswasxKwxLLkNpkk
         8jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539717; x=1770144517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIPiKXcszSKqC5Pe05TjPejSszZASfo0tqdtxtTf+sk=;
        b=dvJOoncrwPj1Jq44p2YK7/+QepbleMlozLp1ZzNEUfKxxFLGev/nbUHEYCUIr8p6cp
         Y/Z4f0Q9kX/K9yyQLeZm+bgox57DsSqho3+A0yCmYCGa/+sl2T46TL83aapc9WSkFXut
         YDbdQGhFd80Jbvg8eEVM/2slsdEiqmXjZefMFZ6J4xjzRAH8UppSZCoYRovHIKnajQQ+
         /9W4f1e0tWTwYqbthaclX5DIzK/nQXLaxJu5OOUFgwjngJdDTUKPRjMZ4xEbWK7GhKfR
         WU0Nudq515IbWltZttqBzda/niC5lgFrBzWymsB7uUmWqce+rwkb7bHTdppQqNWJmW/X
         MqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs+EOopPnT0ynRmyHmBupVA6LANWYmevvAiwPU2Sj5/lKj+XihND1MqzilEaDpcPo5m3oJDt4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfmIvKqYXfVFNOvzlSpQaqOESdl89/o+mW49zTr8KD/RePuaZ/
	L6zEWbTmWxVjPzjBqOjZS4ceYaxEguvpNxXVbAp0JU5hgBWGrHEBxxKU
X-Gm-Gg: AZuq6aIuhfCdOgJSZwfCPB/OLCJdrModjtQfThaQ3OznXluXIoOd+hO3XidfkdppiGV
	Ahx7CHoRIWs99ikedsJ+JC90ebdP4Yf8hRW/G8Yakws5nkj5NerOdh+LFwcVipkWQjXVa4kKvIH
	jap/+U7aOGNhJr34TTRxDVb3yAxBSI5pBE0mzKukzf+2vXO+inr3tSzLX+0FutOMe0wSGJhu796
	etXoGO4tk51OXKKRX/k6CpOihYwg27k6ViJ3VH33pldrD24LTLEJxcHj2SKrjVqa4TLqi95W7GP
	WVhxltuu4tE9Tm7NwniMxBnIw77PiKXC5C24Mn/s4bJxLIKUpwwCoU5wK8oINhwQtV9muLEH3SX
	f6pB/4tMZ6iRVzj4X2i7iGrb5lqTe5UIpuATG8b6+aaRzem7tBVGCX3LOt8CF6ATIqe6j3brwG7
	It3FE/puFCZ2Kn50rubIJr2Ua30+xLFIxjeH7lXSg5BuET3oRFTS2vW8U=
X-Received: by 2002:a05:6000:1a86:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-435dd02c1cbmr3380605f8f.7.1769539716838;
        Tue, 27 Jan 2026 10:48:36 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:36 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH 0/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
Date: Tue, 27 Jan 2026 22:48:06 +0400
Message-Id: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYIeWkC/x3MQQqDQAxG4atI1g3ELJT2KtLFdOZXA+0omSKCe
 HcHl9/ivYMK3FDo1Rzk2KzYkivaR0NxDnkCW6omFe2k1Z4tR8cP+R++PC7OpoXTZnB+InYSRPS
 TEtV+dYy23+/hfZ4X9B0UuGsAAAA=
X-Change-ID: 20260127-incremental-for-i2s-dvier-9ec60a002bdd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=880;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=nzQYk89pkPHGP6R9yMxHj/NHVae7UpktsR44AHN8qy4=;
 b=TJUZT6XopIns2Aq1PkC0y8MR1LmYdMKUSI/PbXI4JnKpP2YxaJmJzDyKFryrDuINikpNhjQxd
 iDhtmZXTcl1BljB5y3BIqfBw/HkpuDVmV3Ugvi5lxIm5dhKFwA/yPv1
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

An incremental patch on top of 
"[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC" 
adding the explanatory comments as requested.
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/

changes: 
 - added description for cv1800b_dac_mute function
 - fixed "extra change" from previos commit

Thanks

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Anton D. Stavinskii (2):
      ASoC: sophgo: cv1800b: document DAC overwrite handling
      ASoC: sophgo: cv1800b: tidy Kconfig spacing

 sound/soc/sophgo/Kconfig             | 1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: bdc79da6c6206a12c9a13ed5e4eb1360d62b321e
change-id: 20260127-incremental-for-i2s-dvier-9ec60a002bdd

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

