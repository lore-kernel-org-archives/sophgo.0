Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D343469E7
	for <sophgo@lists.linux.dev>; Mon,  3 Aug 2026 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737783; cv=none; b=qzFVMQOg2Upd2WheZ6yva24x7U0k5sWtW4DHlydmkxZIy9QPRkLvpgcnatf7S6HU5BZYbHAt7BMcWDzOs9o9FtTxeeBtNde4vvbMMCsfr4OktqtqiSbe699JgomEMt3VfO2Rk0SrVypmAVq6MvhiBjCaqbWdwJiF+6yjgdpDSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737783; c=relaxed/simple;
	bh=0MJrbIEJ75tt62IKggFLwU6RdLbfl6Ybay7Q5moOn1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZ47bQMvEhLMRaUBM9yyitTvfbvwBuud1VG2oioeqOlpWSXFKulDazMMMrmmkNXax0oHimlCTYpE+pu0YGa6Ss3YcaHEvOTUS4xfLNWRD42h9qGwKBmawaw9pXZd1n7Bsnj5CnC0QTuQD94J9f0hIYlCHaSmh43kKfRrxxYEOLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvDJTi0u; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvDJTi0u"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2782322a91.0
        for <sophgo@lists.linux.dev>; Sun, 02 Aug 2026 23:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737782; x=1786342582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzT+ddXFtm+hbBbYEBZVkAXj5U4hIlNKyzNscwXTY8w=;
        b=kvDJTi0uxb02GWeG39+HGuMipQ/Vctrh1e0hkoNsx8+b11fI3nVhrrxEHYal1K+t9u
         Nr2ZBdO5vvkDFUiu2kcCVAVmoI6Qb6txo42Eo7lC7iccse5kG5ORvHSC4ZlHuq1quBlj
         SZvWHE4gCQqsaj6eWgyjrjmMG2r8qogrzohyu3lL1B1OiGaLQPvQJ9993fzfN/P6sW2I
         WsoKudWX390O6ofj8IsDorxc+XhGlH7/8t1oKWeq2KZAKtI+YhZOUN5db1KURg0heM67
         ttlVAVbKxwLgo4hvW495HDk1wwqoqXGJgWCT2GNlsAB9zT454Wl0hICOjMjHGIE4F2aZ
         vaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737782; x=1786342582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzT+ddXFtm+hbBbYEBZVkAXj5U4hIlNKyzNscwXTY8w=;
        b=nTEEn6VeROuNhf7P0BhyxkKnxFCB6Kmoq147W/pzR29YDXdY7fOF4+1YleNfivjxpw
         KQd3HgU8/UstbZG1HzK0kWZOtPWOvdOeU9MvqtqVsqaQGqyLL2U4IRcT3IJ5nD4sr0IX
         ILYnfiWb/VPZZsgaW0l4S++LciHOMv3DrDWoRwbIv8TdPWLlVB8FE3XoRQVZaKAqcA3t
         g6LXypWsx1sfNaDc++RjacsUJjskntUIj3mjAShdXDBKa5dvruo3J0x8nP6N02OX2fMZ
         1rbeJ5bm3Gzj/odfOnkcQS8VBkayVOCn7avQW/TU5NaFo8W7dTOqgrJA/ofigICNmDab
         H70Q==
X-Forwarded-Encrypted: i=1; AHgh+RplRZ+AMgXwa6ri6EP0KLpSL3f9eBSU0Bv9fjt8+F5tnDwAuSWYEQt5+b2IwpuFPOJevyH6/6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxURHJ3RB8JCNhkedcR8PShqzFwP8S/xDW5Tx8zmn+IK0Lj34MB
	UeBHdIunn67PKau5bypRkGGwzny1UAsmQEKRZJrXrY0CV7jgOmaONo4B
X-Gm-Gg: AR+sD13/iA5c41rN3AcFuLC6BugW9oTctMETN1Ub4qzoeTdqstB+guHSgL3CGMuwtwp
	yUMnAxxn02f4cW1CoFMZ04UODq8QWnXUbj+1TOs8kftfiKY7PRMwMm2BNBtjKJyPdwEmeR7DyF7
	G4nflW8hSMp9uC6PJINQh27GT1KEiXmn2wLF8VN1jFcnaqmhD/RmKSQVSzTdBMVd36G09NLotqU
	1dNik4O1HCd+XztPI7eHhqk7EPJmzCYyT3nMJ+3QXdR/SfXuHR7U755J3rgKqWnEVB4sBL4g/bL
	jaJQWcxoE16Bvr7tXD6heHsI2oQ4xud49Gp9jBVW3G5GhHkOivCOh58ETmr0ameHLvcUjkoAPD9
	wNNPmeCmkPQKZ0mIHsg6JEiRALSUqZiSdCOPcBaMvcxHr6cAFkxO1IM2fhi16baedLZ3WNrH/lj
	dp2Zlz6i3tae0zsa1gl2/O5Lc2n4JRN8FJS+GHenJUvpPzeycBRELEzD1iyra501lDxgLbNNNkK
	Lu7TdsqMcjDmxAT/XUSfKncCaYhNCVd5QxiNB168hHVA1RF5tCoDb/1klE8Bfr0j9I5nV3t1APH
	2ayeiRQkcZeVDHk=
X-Received: by 2002:a17:90b:4acb:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-38fbc4a1f5emr8190713a91.19.1785737781877;
        Sun, 02 Aug 2026 23:16:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f6539fsm3469002a91.5.2026.08.02.23.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:16:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen Wang <chen.wang@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	stavinsky@gmail.com,
	sophgo@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: sophgo: Drop redundant error messages
Date: Mon,  3 Aug 2026 13:16:04 +0700
Message-ID: <20260803061605.35485-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sophgo/cv1800b-tdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-tdm.c b/sound/soc/sophgo/cv1800b-tdm.c
index 4cbac8c1160f..a97f775aeddc 100644
--- a/sound/soc/sophgo/cv1800b-tdm.c
+++ b/sound/soc/sophgo/cv1800b-tdm.c
@@ -677,10 +677,8 @@ static int cv1800b_i2s_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
-	if (ret) {
-		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0

